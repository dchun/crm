class CreateNeglectedTerms < ActiveRecord::Migration
  def change
    create_table :neglected_terms do |t|
      t.string :exclude

      t.timestamps
    end
  end
end
