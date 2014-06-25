class CreateAcceptableContactSalutations < ActiveRecord::Migration
  def change
    create_table :acceptable_contact_salutations do |t|
      t.string :salutation

      t.timestamps
    end
  end
end
