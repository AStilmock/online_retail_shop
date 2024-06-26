# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_18_220043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.integer "price_percent"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email"
    t.integer "phone"
    t.integer "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "invoice_id", null: false
    t.bigint "item_id", null: false
    t.bigint "discount_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_invoice_items_on_discount_id"
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["item_id"], name: "index_invoice_items_on_item_id"
    t.index ["user_id"], name: "index_invoice_items_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "date_time"
    t.integer "sub_total_sale_price"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "unit_price"
    t.integer "item_cost"
    t.integer "quantity"
    t.boolean "in_stock"
    t.bigint "product_category_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_items_on_product_category_id"
    t.index ["vendor_id"], name: "index_items_on_vendor_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "purchase_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["item_id"], name: "index_purchase_order_items_on_item_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.datetime "date_time"
    t.string "description"
    t.integer "quantity"
    t.boolean "complete"
    t.bigint "user_id", null: false
    t.bigint "vendor_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_purchase_orders_on_item_id"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
    t.index ["vendor_id"], name: "index_purchase_orders_on_vendor_id"
  end

  create_table "sale_invoices", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "invoice_id", null: false
    t.bigint "user_id", null: false
    t.bigint "discount_id", null: false
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_sale_invoices_on_discount_id"
    t.index ["invoice_id"], name: "index_sale_invoices_on_invoice_id"
    t.index ["sale_id"], name: "index_sale_invoices_on_sale_id"
    t.index ["user_id"], name: "index_sale_invoices_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "date_time"
    t.integer "sub_total_sale_price"
    t.integer "shipping"
    t.integer "taxes"
    t.integer "total_sale_price"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "permission", default: 0
    t.integer "discount", default: 0
    t.string "password"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "users"
  add_foreign_key "invoice_items", "discounts"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "items"
  add_foreign_key "invoice_items", "users"
  add_foreign_key "items", "product_categories"
  add_foreign_key "items", "vendors"
  add_foreign_key "purchase_order_items", "items"
  add_foreign_key "purchase_order_items", "purchase_orders"
  add_foreign_key "purchase_orders", "items"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "purchase_orders", "vendors"
  add_foreign_key "sale_invoices", "discounts"
  add_foreign_key "sale_invoices", "invoices"
  add_foreign_key "sale_invoices", "sales"
  add_foreign_key "sale_invoices", "users"
end
