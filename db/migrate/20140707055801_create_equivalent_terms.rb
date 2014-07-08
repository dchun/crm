class CreateEquivalentTerms < ActiveRecord::Migration
  def change
    create_table :equivalent_terms do |t|
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
