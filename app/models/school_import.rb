class SchoolImport
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
    if imported_schools.map(&:valid?).all?
      imported_schools.each(&:save!)
      true
    else
      imported_schools.each_with_index do |school, index|
        school.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_schools
    @imported_schools ||= load_imported_schools
  end

  def load_imported_schools
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    schools = []
    (2..spreadsheet.last_row).collect do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      school = School.find_by_id(row["id"]) || School.new
      school.attributes = row.to_hash.slice(*School.attribute_names())
      schools << school
    end
    schools
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
