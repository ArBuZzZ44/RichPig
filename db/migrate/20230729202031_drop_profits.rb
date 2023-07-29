class DropProfits < ActiveRecord::Migration[7.0]
  def change
		drop_table :profits do |t|
      t.integer :profit
      t.string :profit_type
      t.date :profit_date

      t.timestamps
    end
  end
end
