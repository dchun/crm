class District < ActiveRecord::Base
  has_many :schools
  # has_many :contacts, through: :schools

  validates_presence_of :name
  validates_presence_of :state

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |district|
        csv << district.attributes.values_at(*column_names)
      end
    end
  end

  def self.with_all
    joins(schools: :contacts)
    .select('districts.*, count(distinct schools.id) as schools_count, count(distinct contacts.id) as contacts_count')
    .uniq
    .group('districts.id')
  end
end
