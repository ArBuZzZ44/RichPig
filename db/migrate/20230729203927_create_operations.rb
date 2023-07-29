class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :operation_type
      t.integer :operation_amount
      t.date :operation_date
      t.belongs_to :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
