# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_31_033611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.decimal "last_rate"
    t.datetime "update_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "codename"
  end

  create_table "limit_orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "currency_id", null: false
    t.decimal "amount"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "sell_price"
    t.index ["currency_id"], name: "index_limit_orders_on_currency_id"
    t.index ["user_id"], name: "index_limit_orders_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.decimal "amount"
    t.decimal "price"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "number"
    t.string "state"
    t.index ["currency_id"], name: "index_orders_on_currency_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

<<<<<<< HEAD
  create_table "transfers", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.decimal "amount"
    t.string "target"
    t.string "num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "txid"
    t.index ["currency_id"], name: "index_transfers_on_currency_id"
    t.index ["user_id"], name: "index_transfers_on_user_id"
=======
  create_table "transaction_records", force: :cascade do |t|
    t.bigint "limit_order_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["limit_order_id"], name: "index_transaction_records_on_limit_order_id"
    t.index ["user_id"], name: "index_transaction_records_on_user_id"
>>>>>>> rspec and transaction function
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "unread", default: 0
    t.boolean "status", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "recognition"
    t.decimal "amount"
    t.bigint "user_id", null: false
    t.bigint "currency_id", null: false
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "limit_orders", "currencies"
  add_foreign_key "limit_orders", "users"
  add_foreign_key "orders", "currencies"
  add_foreign_key "orders", "users"
  add_foreign_key "records", "users"
<<<<<<< HEAD
  add_foreign_key "transfers", "currencies"
  add_foreign_key "transfers", "users"
=======
  add_foreign_key "transaction_records", "limit_orders"
  add_foreign_key "transaction_records", "users"
>>>>>>> rspec and transaction function
  add_foreign_key "wallets", "currencies"
  add_foreign_key "wallets", "users"
end
