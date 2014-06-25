class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :salutation
      t.string :position
      t.string :role
      t.boolean :complete
      t.belongs_to :school, index: true

      t.timestamps
    end
  end
end
