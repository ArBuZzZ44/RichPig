class AddWalletIdToProfits < ActiveRecord::Migration[7.0]
  def change
    add_reference :profits, :wallet, null: false, foreign_key: true
  end
end
