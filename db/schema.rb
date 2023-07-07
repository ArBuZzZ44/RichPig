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

ActiveRecord::Schema[7.0].define(version: 2023_07_07_073537) do
  create_table "additions", force: :cascade do |t|
    t.integer "balance"
    t.integer "capital_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capital_id"], name: "index_additions_on_capital_id"
  end

  create_table "capitals", force: :cascade do |t|
    t.integer "amount"
    t.integer "period"
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "not completed", null: false
  end

  create_table "finances", force: :cascade do |t|
    t.string "title"
    t.integer "cost"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "payment"
    t.string "payment_type"
    t.date "payment_date"
    t.integer "wallet_id", null: false
    t.index ["wallet_id"], name: "index_payments_on_wallet_id"
  end

  create_table "profits", force: :cascade do |t|
    t.integer "profit"
    t.string "profit_type"
    t.date "profit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wallet_id", null: false
    t.index ["wallet_id"], name: "index_profits_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "budget"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additions", "capitals"
  add_foreign_key "payments", "wallets"
  add_foreign_key "profits", "wallets"
end
