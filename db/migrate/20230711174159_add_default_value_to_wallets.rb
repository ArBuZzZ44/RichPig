class AddDefaultValueToWallets < ActiveRecord::Migration[7.0]
  def change
    change_column :wallets, :start_date, :date, default: Time.now, null: false
  end
end
