class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.datetime :date_time
      t.integer :sub_total_sale_price
      t.integer :shipping
      t.integer :taxes
      t.integer :total_sale_price
      t.boolean :complete

      t.timestamps
    end
  end
end
