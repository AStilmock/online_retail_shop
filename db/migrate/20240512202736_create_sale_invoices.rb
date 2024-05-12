class CreateSaleInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_invoices do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.datetime :date_time
      t.integer :discount

      t.timestamps
    end
  end
end
