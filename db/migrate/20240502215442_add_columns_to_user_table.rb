class AddColumnsToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :permission, :integer, default: 0
    add_column :users, :discount, :integer, default: 0
  end
end
