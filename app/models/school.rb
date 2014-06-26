class School < ActiveRecord::Base
  belongs_to :district

  validates_presence_of :name
  validates_presence_of :state_rank
  validate :similar_school_names

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
end
