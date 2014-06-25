class CreateAcceptableContactRoles < ActiveRecord::Migration
  def change
    create_table :acceptable_contact_roles do |t|
      t.string :role

      t.timestamps
    end
  end
end
