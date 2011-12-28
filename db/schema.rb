# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100125214429) do

  create_table "bids", :force => true do |t|
    t.string   "product"
    t.string   "barcode"
    t.string   "vehicle"
    t.text     "description"
    t.decimal  "price"
    t.boolean  "notified"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "who"
    t.decimal  "cost"
    t.string   "who_last"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "fullname"
    t.string   "ssn"
    t.string   "address1"
    t.string   "address2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telephone"
    t.string   "email"
    t.string   "vehicle"
    t.string   "club"
    t.string   "who"
    t.string   "who_last"
  end

  create_table "expenses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "who"
    t.string   "who_last"
  end

  create_table "inventories", :force => true do |t|
    t.integer  "product_id"
    t.datetime "purchase_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost"
    t.decimal  "tax_ratio",      :default => 0.0825
    t.decimal  "import_ratio",   :default => 0.15
    t.decimal  "currency_ratio"
    t.decimal  "top_ratio"
    t.decimal  "bottom_ratio"
    t.string   "who"
    t.string   "who_last"
  end

  create_table "invoices", :force => true do |t|
    t.string   "place"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "who"
    t.string   "who_last"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "barcode"
    t.decimal  "cost"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.string   "image",       :default => "nopic.png"
    t.string   "who"
    t.boolean  "consignment"
    t.string   "who_last"
  end

  create_table "sales", :force => true do |t|
    t.integer  "inventory_id"
    t.datetime "sale_date"
    t.decimal  "sale_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
    t.string   "who"
    t.string   "who_last"
  end

  create_table "settings", :force => true do |t|
    t.string   "var",        :null => false
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["var"], :name => "index_settings_on_var"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.datetime "date"
    t.string   "name"
    t.decimal  "charge"
    t.decimal  "payment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "who"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
