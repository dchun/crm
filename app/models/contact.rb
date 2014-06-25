class Contact < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :fname
  validates_presence_of :lname

  validates_inclusion_of :salutation, in: :acceptable_salutation_list
  validates_inclusion_of :position, in: :acceptable_position_list
  validates_inclusion_of :role, in: :acceptable_role_list

  validates_inclusion_of :school_first_downcase, 
                         message: "may be duplicate, check against School names",
                         in: :school_first_downcase_list, 
                         unless: :school_full_match

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

  def school_full_match
    School.find_by_name(self.school.name)
  end

  def school_first_downcase
    s_name = self.school.name.split[0].downcase
  end

  def school_first_downcase_list
    s = School.all
    s_list = s.collect{ |s| s.name.split[0].downcase }
  end
end