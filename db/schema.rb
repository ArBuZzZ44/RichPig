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

ActiveRecord::Schema[7.0].define(version: 2023_07_04_144802) do
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
  end

  create_table "profits", force: :cascade do |t|
    t.integer "profit"
    t.string "profit_type"
    t.date "profit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additions", "capitals"
end
