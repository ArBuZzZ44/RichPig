class AddStatusToCapitals < ActiveRecord::Migration[7.0]
  def change
    add_column :capitals, :status, :string, default: "not completed", null: false
  end
end
