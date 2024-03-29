class School < ActiveRecord::Base
  belongs_to :district
  has_many :contacts

  validates_presence_of :name
  validates_presence_of :district

  geocoded_by :address

  def address
    "#{street_address}, #{city}, #{state}, #{zip}"
  end

  def address_changed?
    attrs = %w(street_address city state zip)
    attrs.any?{|a| send "#{a}_changed?"}
  end

  # Include count of Contacts in School
  def self.with_contacts
    select('schools.*, count(distinct c.id) as contacts_count')
    .joins('LEFT OUTER JOIN contacts c ON c.school_id = schools.id')
    .group('schools.id')
  end

  # New find methods
  def self.find_by_downcase_name(name)
    School.where("LOWER(name) = ?", name.downcase).first
  end

  def self.find_by_equivalent_terms(name)
    et = EquivalentTerm.all
    et.each {|replacement| name = name.gsub(replacement.input, replacement.output)}
    School.where("LOWER(name) = ?", name.downcase).first
  end

  def self.find_by_neglected_terms(name)
    nt = NeglectedTerm.all
    nt.each {|n| name = name.gsub(n.exclude, '').squeeze(' ')}
    sql = "REPLACE(schools.name, '#{nt[0].exclude}', '')"
    nt.drop(1).map do |n|
      sql.prepend("REPLACE(") 
      sql << ", '#{n.exclude}', '')" 
    end
    sql.prepend("LOWER(")
    sql << ") = '#{name.downcase}'"
    School.where(sql).first
  end

  def self.find_by_equivalent_and_neglected_terms(name)
    et = EquivalentTerm.all
    et.each {|e| name = name.gsub(e.input, e.output)}
    nt = NeglectedTerm.all
    nt.each {|n| name = name.gsub(n.exclude, '').squeeze(' ')}
    sql = "REPLACE(schools.name, '#{nt[0].exclude}', '')"
    nt.drop(1).map do |n|
      sql.prepend("REPLACE(") 
      sql << ", '#{n.exclude}', '')" 
    end
    sql.prepend("LOWER(")
    sql << ") = '#{name.downcase}'"
    School.where(sql).first
  end

  # Convert float setters
  def convert_string(string)
    case string
    when "N/A" then string = 10000
    when "Does" then string = 10001
    when "Achieves" then string = 10002
    when "Unranked" then string = 10003
    when /\A#/ then string.to_s.gsub(/[^0-9\.]/, '')
    else string
    end   
  end

  def state_rank=(new_state_rank)
    write_attribute( :state_rank, convert_string(new_state_rank) )
  end

  def national_rank=(new_national_rank)
    write_attribute( :national_rank, convert_string(new_national_rank) )
  end

  def college_readiness_score=(new_college_readiness_score)
    write_attribute( :college_readiness_score, convert_string(new_college_readiness_score) )
  end

  def tested_ap_ib=(new_tested_ap_ib)
    write_attribute( :tested_ap_ib, convert_string(new_tested_ap_ib) )
  end

  def pass_ap_ib=(new_pass_ap_ib)
    write_attribute( :pass_ap_ib, convert_string(new_pass_ap_ib) )
  end

  def math_score=(new_math_score)
    write_attribute( :math_score, convert_string(new_math_score) )
  end

  def math_proficient=(new_math_proficient)
    write_attribute( :math_proficient, convert_string(new_math_proficient) )
  end

  def math_not_proficient=(new_math_not_proficient)
    write_attribute( :math_not_proficient, convert_string(new_math_not_proficient) )
  end

  def reading_score=(new_reading_score)
    write_attribute( :reading_score, convert_string(new_reading_score) )
  end

  def reading_proficient=(new_reading_proficient)
    write_attribute( :reading_proficient, convert_string(new_reading_proficient) )
  end

  def reading_not_proficient=(new_reading_not_proficient)
    write_attribute( :reading_not_proficient, convert_string(new_reading_not_proficient) )
  end

  def total_economically_disadvantaged=(new_total_economically_disadvantaged)
    write_attribute( :total_economically_disadvantaged, convert_string(new_total_economically_disadvantaged) )
  end

  def ap_student_performance_participation_rate=(new_ap_student_performance_participation_rate)
    write_attribute( :ap_student_performance_participation_rate, convert_string(new_ap_student_performance_participation_rate) )
  end

  def ap_student_performance_participant_passing_rate=(new_ap_student_performance_participant_passing_rate)
    write_attribute( :ap_student_performance_participant_passing_rate, convert_string(new_ap_student_performance_participant_passing_rate) )
  end

  def ap_student_performance_exam_per_test_taker=(new_ap_student_performance_exam_per_test_taker)
    write_attribute( :ap_student_performance_exam_per_test_taker, convert_string(new_ap_student_performance_exam_per_test_taker) )
  end

  def ap_student_performance_exam_pass_rate=(new_ap_student_performance_exam_pass_rate)
    write_attribute( :ap_student_performance_exam_pass_rate, convert_string(new_ap_student_performance_exam_pass_rate) )
  end

  # Convert boolean getters
  def convert_tautology(truth)
    case truth
    when "Yes" then truth = true
    when "No" then truth = false
    else truth
    end
  end

  def receives_title_i_funding=(new_receives_title_i_funding)
    write_attribute( :receives_title_i_funding, convert_tautology(new_receives_title_i_funding) )  
  end

  # Convert float getters
  def convert_float(float)
    case float
    when 10000 then float = "N/A"
    when 10001 then float = "Does"
    when 10002 then float = "Achieves"
    when 10003 then float = "Unranked"
    else float
    end   
  end

  def college_readiness_score
    convert_float( read_attribute(:college_readiness_score) )
  end

  def tested_ap_ib
    convert_float( read_attribute(:tested_ap_ib) )
  end

  def pass_ap_ib
    convert_float( read_attribute(:pass_ap_ib) )
  end

  def math_score
    convert_float( read_attribute(:math_score) )
  end

  def math_proficient
    convert_float( read_attribute(:math_proficient) )
  end

  def math_not_proficient
    convert_float( read_attribute(:math_not_proficient) )
  end

  def reading_score
    convert_float( read_attribute(:reading_score) )
  end

  def reading_proficient
    convert_float( read_attribute(:reading_proficient) )
  end

  def reading_not_proficient
    convert_float( read_attribute(:reading_not_proficient) )
  end

  def total_economically_disadvantaged
    convert_float( read_attribute(:total_economically_disadvantaged) )
  end

  def ap_student_performance_participation_rate
    convert_float( read_attribute(:ap_student_performance_participation_rate) )
  end

  def ap_student_performance_participant_passing_rate
    convert_float( read_attribute(:ap_student_performance_participant_passing_rate) )
  end

  def ap_student_performance_exam_per_test_taker
    convert_float( read_attribute(:ap_student_performance_exam_per_test_taker) )
  end

  def ap_student_performance_exam_pass_rate
    convert_float( read_attribute(:ap_student_performance_exam_pass_rate) )
  end

  def state_rank
    convert_float( read_attribute(:state_rank) )
  end

  def national_rank
    convert_float( read_attribute(:national_rank) )
  end

  # Import Function
  def self.import(fileimportid)
    fileimport = FileImport.find(fileimportid)
    file_name = fileimport.file_name
    file_path = fileimport.file_path.url

    newcount = 0
    updatecount = 0
    newdistrict = 0
    updateddistrict = 0
    errors = ""

    spreadsheet = open_spreadsheet(file_name, file_path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # Update by id if it exists in the csv file
      if row["id"].present?
        school = School.find_by_id(row["id"]) || School.new
        school.id? ? updatecount += 1 : newcount += 1
        school.attributes = row.to_hash.slice(*School.attribute_names())
      else
        school = School.find_by_name(row["name"]) || School.new
        school.id? ? updatecount += 1 : newcount += 1
        school.attributes = row.to_hash.slice(*School.attribute_names())
      end

      if row["city_state_zip"].present?
        school.city = row["city_state_zip"].split(",").first
        school.zip = row["city_state_zip"].split(",").second.gsub(/[^0-9\.]/, '')
      end

      if row["district_name"].present?
        district = District.find_by_name(row["district_name"]) || District.new(:name => row["district_name"])
        district.id? ? updateddistrict += 1 : newdistrict += 1
        school.district = district
      end

      # Validate school and save or raise error
      if school.valid?
        school.save
      else
        school.id? ? updatecount -= 1 : newcount -= 1
        if row["district_name"].present?
          district.id? ? updateddistrict -= 1 : newdistrict -= 1
        end
        school.errors.full_messages.each do |message|
          errors << "Row #{i}: #{message} \r\n"
        end
      end
    end
    results = "#{newcount} New Schools.\r\n#{updatecount} Schools Updated.\r\n#{newdistrict} New Districts.\r\n#{updateddistrict} Districts added to Schools.\r\n#{errors}"
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
      all.each do |school|
        csv << school.attributes.values_at(*column_names)
      end
    end
  end
end
