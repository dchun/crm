class ContactImport
  extend ActiveModel::Model 
  include ActiveModel::Model

  attr_accessor :file

  def persisted?
    false
  end
end
