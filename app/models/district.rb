class District < ActiveRecord::Base
  has_many :schools

  validates_presence_of :name
  validates_presence_of :state

  # Include count of Schools and Contacts in District
  def self.with_all
    select('districts.*, count(distinct s.id) as schools_count, count(distinct c.id) as contacts_count')
    .joins('LEFT OUTER JOIN schools s ON s.district_id = districts.id')
    .joins('LEFT OUTER JOIN contacts c ON c.school_id = s.id')
    .group('districts.id')
  end

  # Convert float setters
  def convert_string(string)
    case string
    when "N/A" then string = 10000
    when "Does" then string = 10001
    when "Achieves" then string = 10002
    else string
    end   
  end

  def college_readiness_score=(new_college_readiness_score)
    write_attribute( :college_readiness_score, convert_string(new_college_readiness_score) )  
  end

  def tested_ap=(new_tested_ap)
    write_attribute( :tested_ap, convert_string(new_tested_ap) )
  end

  def passed_ap=(new_passed_ap)
    write_attribute( :passed_ap, convert_string(new_passed_ap) )
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

  # Convert float getters
  def convert_float(float)
    case float
    when 10000 then float = "N/A"
    when 10001 then float = "Does"
    when 10002 then float = "Achieves"
    else float
    end   
  end

  def college_readiness_score
    convert_float( read_attribute(:college_readiness_score) )
  end

  def tested_ap
    convert_float( read_attribute(:tested_ap) )
  end

  def passed_ap
    convert_float( read_attribute(:passed_ap) )
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

  # Export Function
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |district|
        csv << district.attributes.values_at(*column_names)
      end
    end
  end
end
