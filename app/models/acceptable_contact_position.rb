class AcceptableContactPosition < ActiveRecord::Base
  validates_uniqueness_of :position
end
