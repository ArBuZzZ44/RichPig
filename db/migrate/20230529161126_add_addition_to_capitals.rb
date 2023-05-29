class AddAdditionToCapitals < ActiveRecord::Migration[7.0]
  def change
    add_column :capitals, :addition, :integer
  end
end
