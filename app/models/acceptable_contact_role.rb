class AcceptableContactRole < ActiveRecord::Base
  validates_uniqueness_of :role
end
