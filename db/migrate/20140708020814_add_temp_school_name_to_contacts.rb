class AddTempSchoolNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :temp_school_name, :string
  end
end
