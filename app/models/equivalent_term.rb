class EquivalentTerm < ActiveRecord::Base
  validates_presence_of :input
  validates_presence_of :output
end
