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

  # def save
  #   if imported_schools.map(&:valid?).all?
  #     imported_schools.each(&:save!)
  #     true
  #   else
  #     imported_schools.each_with_index do |school, index|
  #       school.errors.full_messages.each do |message|
  #         errors.add :base, "Row #{index+2}: #{message}"
  #       end
  #     end
  #     false
  #   end
  # end

  # def imported_schools
  #   @imported_schools ||= load_imported_schools
  # end

  # def load_imported_schools
  #   spreadsheet = open_spreadsheet
  #   header = spreadsheet.row(1)
  #   schools = []
  #   (2..spreadsheet.last_row).collect do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     if row["id"].present?
  #       school = School.find_by_id(row["id"]) || School.new
  #       school.attributes = row.to_hash.slice(*School.attribute_names())
  #     else
  #       school = School.find_by_name(row["name"]) || School.new
  #       school.attributes = row.to_hash.slice(*School.attribute_names())
  #     end
  #     district = District.find_by_name(row["district"]) || District.new(:name => row["district"])
  #     school.district = district
  #     schools << school
  #   end
  #   schools
  # end

  def self.import(fileimportid)
    fileimport = Fileimport.find(fileimportid)
    file_name = fileimport.file_name
    file_path = fileimport.file_path

    spreadsheet = open_spreadsheet(file_name, file_path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if row["id"].present?
        school = School.find_by_id(row["id"]) || School.new
        school.attributes = row.to_hash.slice(*School.attribute_names())
      else
        school = School.find_by_name(row["name"]) || School.new
        school.attributes = row.to_hash.slice(*School.attribute_names())
      end
      district = District.find_by_name(row["district"]) || District.new(:name => row["district"])
      school.district = district
      if school.valid?
        school.save!
      else
        raise "not valid"
      end
    end
  end

  def self.open_spreadsheet(file_name, file_path)
    case File.extname(file_name)
    when ".csv" then Roo::CSV.new(file_path, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file_path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file_path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
