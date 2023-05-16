class CreateCapitals < ActiveRecord::Migration[7.0]
  def change
    create_table :capitals do |t|
      t.integer :amount
      t.integer :period
      t.string :goal

      t.timestamps
    end
  end
end
