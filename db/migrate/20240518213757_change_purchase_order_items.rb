class ChangePurchaseOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_order_items, :quantity, :integer
  end
end
