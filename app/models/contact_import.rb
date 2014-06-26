class ContactImport
  extend ActiveModel::Model 
  include ActiveModel::Model

  attr_accessor :file

  def initialze(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_contacts.map(&:valid?).all?
      imported_contacts.each(&:save!)
      true
    else
      imported_contacts.each_with_index do |contact, index|
        contact.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_contacts
    @imported_contacts ||= load_imported_contacts
  end

  def load_imported_contacts
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    contacts = []
    (2..spreadsheet.last_row).collect do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if row["id"].present?
        contact = Contact.find_by_id(row["id"]) || Contact.new
        contact.attributes = row.to_hash.slice(*Contact.attribute_names())
      else
        contact = Contact.find_by_email(row["email"]) || Contact.new
        contact.attributes = row.to_hash.slice(*Contact.attribute_names())
      end
      school = School.find_by_name(row["school"]) || School.new(:name => row["school"])
      contact.school = school
      contacts << contact
    end
    contacts
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
