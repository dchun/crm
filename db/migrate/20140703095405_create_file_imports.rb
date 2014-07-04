class CreateFileImports < ActiveRecord::Migration
  def change
    create_table :file_imports do |t|
      t.string :file_name
      t.string :file_path

      t.timestamps
    end
  end
end
