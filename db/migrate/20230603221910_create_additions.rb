class CreateAdditions < ActiveRecord::Migration[7.0]
  def change
    create_table :additions do |t|
      t.integer :balance
      t.belongs_to :capital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
