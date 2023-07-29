class DropPayments < ActiveRecord::Migration[7.0]
  def change
		drop_table :payments do |t|
      t.integer :payment
      t.string :payment_type
      t.date :payment_date
		end
  end
end
