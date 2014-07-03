class School < ActiveRecord::Base
  belongs_to :district
  has_many :contacts

  validates_presence_of :name
  validates_presence_of :district
  # validate :similar_school_names

  geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  def address
    "#{street_address}, #{city}, #{state}, #{zip}"
  end

  def address_changed?
    attrs = %w(street_address city state zip)
    attrs.any?{|a| send "#{a}_changed?"}
  end

  def similar_school_names
    s = School.all
    s_list = s.collect{ |s| s.name }
    unless s_list.include?(self.name)
      s_names = s.collect{ |s| s.name.split[0].downcase if s.name.present? }
      if self.name.present?
        if s_names.include? self.name.split[0].downcase
          errors.add :possible_school_duplication, 'check name against list'
        end
      end
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |school|
        csv << school.attributes.values_at(*column_names)
      end
    end
  end

  def self.with_contacts
    select('schools.*, count(contacts.id) as contacts_count')
    .joins('LEFT OUTER JOIN contacts ON contacts.school_id = schools.id')
    .group('schools.id')
  end

  def state_rank=(new_state_rank)
    write_attribute( :state_rank, new_state_rank.to_s.gsub(/[^0-9\.]/, '') )
  end

  def national_rank=(new_national_rank)
    write_attribute( :national_rank, new_national_rank.to_s.gsub(/[^0-9\.]/, '') )
  end

  def convert_string(string)
    case string
    when "N/A" then string = 10000
    when "Does" then string = 10001
    when "Achieves" then string = 10002
    when "Unranked" then string = 10003
    else string
    end   
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

  def convert_float(float)
    case float
    when 10000 then float = "N/A"
    when 10001 then float = "Does"
    when 10002 then float = "Achieves"
    when 10003 then float - "Unranked"
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
end
