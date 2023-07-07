class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.integer :budget
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
