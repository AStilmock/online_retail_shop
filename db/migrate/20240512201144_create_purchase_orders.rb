class CreatePurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_orders do |t|
      t.datetime :date_time
      t.string :description
      t.integer :quantity
      t.boolean :complete
      t.references :user, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
