class AddErrorsToFileImport < ActiveRecord::Migration
  def change
    add_column :file_imports, :results, :text
  end
end
