class DistrictImport
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
    if imported_districts.map(&:valid?).all?
      imported_districts.each(&:save!)
      true
    else
      imported_districts.each_with_index do |district, index|
        district.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_districts
    @imported_districts ||= load_imported_districts
  end

  def load_imported_districts
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    districts = []
    (2..spreadsheet.last_row).collect do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if row["id"].present?
        district = District.find_by_id(row["id"]) || District.new
        district.attributes = row.to_hash.slice(*District.attribute_names())
      else
        district = District.find_by_name(row["name"]) || District.new
        district.attributes = row.to_hash.slice(*District.attribute_names())
      end
      districts << district
    end
    districts
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
