class District < ActiveRecord::Base
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
end
