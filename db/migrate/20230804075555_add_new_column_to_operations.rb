class AddNewColumnToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :category, :string
  end
end
