class CreateAcceptableContactPositions < ActiveRecord::Migration
  def change
    create_table :acceptable_contact_positions do |t|
      t.string :position

      t.timestamps
    end
  end
end
