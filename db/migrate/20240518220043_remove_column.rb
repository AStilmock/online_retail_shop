class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :sale_invoices, :discount
  end
end
