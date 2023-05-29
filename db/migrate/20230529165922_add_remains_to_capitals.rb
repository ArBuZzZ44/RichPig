class AddRemainsToCapitals < ActiveRecord::Migration[7.0]
  def change
    add_column :capitals, :remains, :integer, default: Capital.amount
  end
end
