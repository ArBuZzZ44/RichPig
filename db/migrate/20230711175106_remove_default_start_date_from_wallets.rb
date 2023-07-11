class RemoveDefaultStartDateFromWallets < ActiveRecord::Migration[7.0]
  def up 
    change_column_default :wallets, :start_date, from: Time.now, to: nil
  end
end
