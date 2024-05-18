class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
