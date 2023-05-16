class CreateFinances < ActiveRecord::Migration[7.0]
  def change
    create_table :finances do |t|
      t.string :title
      t.integer :cost
      t.string :date

      t.timestamps
    end
  end
end
