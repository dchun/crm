class School < ActiveRecord::Base
  belongs_to :district
  has_many :contacts

  validates_presence_of :name
  validates_presence_of :district
  validate :similar_school_names

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
    joins(:contacts).select('schools.*, count(distinct contacts.id) as contacts_count')
    .uniq
    .group('schools.id')
  end
end
