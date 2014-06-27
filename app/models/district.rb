class District < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :state
end
