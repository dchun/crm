class AcceptableContactSalutation < ActiveRecord::Base
  validates_uniqueness_of :salutation
end
