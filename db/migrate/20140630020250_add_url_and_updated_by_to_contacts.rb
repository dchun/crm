class AddUrlAndUpdatedByToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :reference_url, :string
    add_column :contacts, :updated_by, :string
  end
end
