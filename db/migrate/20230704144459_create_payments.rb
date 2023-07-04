class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :payment
      t.string :payment_type
      t.date :payment_date
    end
  end
end
