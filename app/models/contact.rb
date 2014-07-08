class Contact < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :fname
  validates_presence_of :email
  validates_presence_of :salutation
  validates_presence_of :position
  validates_presence_of :role

  validates_inclusion_of :salutation, in: :acceptable_salutation_list
  validates_inclusion_of :position, in: :acceptable_position_list
  validates_inclusion_of :role, in: :acceptable_role_list

  after_validation :set_record_complete

  def update_attributes_only_if_blank(attributes)
    attributes.each { |k,v| attributes.delete(k) unless read_attribute(k).blank? || k == 'updated_by'}
    update_attributes(attributes)
  end

  def set_record_complete
    self.fname? && self.lname? && self.salutation? && self.position? && self.role? && self.reference_url? ? self.complete = true : self.complete = false 
  end

  # Convert salutation setters
  def convert_salutation(string)
    case string
    when "Mr" then string = "Mr."
    when "Ms" then string = "Mrs."
    when "Mrs" then string = "Mrs."
    else string
    end   
  end

  def salutation=(new_salutation)
    write_attribute( :salutation, convert_salutation(new_salutation) )
  end

  def acceptable_salutation_list
    s_list = AcceptableContactSalutation.all
    s_list.collect{ |s| s.salutation }
  end

  def acceptable_position_list
    p_list = AcceptableContactPosition.all
    p_list.collect{ |p| p.position }
  end

  def acceptable_role_list
    r_list = AcceptableContactRole.all
    r_list.collect{ |r| r.role }
  end

  # Import Function
  def self.import(fileimportid)
    fileimport = FileImport.find(fileimportid)
    file_name = fileimport.file_name
    file_path = fileimport.file_path

    newcount = 0
    updatecount = 0
    tempschool = 0
    updatedschool = 0
    errors = ""

    spreadsheet = open_spreadsheet(file_name, file_path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # Update by id if it exists in the csv file
      if row["id"].present?
        contact = Contact.find_by_id(row["id"]) || Contact.new
        contact.id? ? updatecount += 1 : newcount += 1
        contact.attributes = row.to_hash.slice(*Contact.attribute_names())
      else
        contact = Contact.find_by_email(row["email"]) || Contact.new
        contact.id? ? updatecount += 1 : newcount += 1
        contact.attributes = row.to_hash.slice(*Contact.attribute_names())
      end
      if row["school_name"].present?
        school = School.find_by_downcase_name(row["school_name"]) || School.find_by_equivalent_terms(row["school_name"]) || School.find_by_neglected_terms(row["school_name"]) || School.find_by_equivalent_and_neglected_terms(row["school_name"])
        if school.present?
          updatedschool += 1
          contact.school = school
        else
          tempschool += 1
          contact.temp_school_name = row["school_name"]
        end
      end

      # Validate school and save or raise error
      if contact.valid?
        contact.save
      else
        contact.id? ? updatecount -= 1 : newcount -= 1
        if row["school_name"].present?
          school.id? ? updatedschool -= 1 : tempschool -= 1
        end
        errors << "Row #{i}: #{contact.errors.full_messages.to_sentence}\r\n"
      end
    end
    results = "#{newcount} New Contacts.\r\n#{updatecount} Contacts Updated.\r\n#{tempschool} Temporary Schools.\r\n#{updatedschool} existing Schools added to Contacts.\r\n#{errors}"
    fileimport.update(results: results)
  end

  def self.open_spreadsheet(file_name, file_path)
    case File.extname(file_name)
    when ".csv" then Roo::CSV.new(file_path, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file_path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file_path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  # Export Function
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
  end
end