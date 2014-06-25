class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :state
      t.string :name
      t.float :college_readiness_score
      t.float :tested_ap
      t.float :passed_ap
      t.float :math_score
      t.float :math_proficient
      t.float :math_not_proficient
      t.float :reading_score
      t.float :reading_proficient
      t.float :reading_not_proficient

      t.timestamps
    end
  end
end
