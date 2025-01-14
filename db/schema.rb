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

ActiveRecord::Schema[7.2].define(version: 2025_01_14_044125) do
  create_table "brands", charset: "latin1", force: :cascade do |t|
    t.string "name", limit: 120
    t.bigint "country_id", null: false
    t.string "code", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_brands_on_country_id"
  end

  create_table "countries", charset: "latin1", force: :cascade do |t|
    t.string "name", limit: 120
    t.string "iso_code", limit: 3
    t.integer "region_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "latin1", force: :cascade do |t|
    t.integer "short_code"
    t.string "long_code", limit: 15
    t.string "description", limit: 120
    t.string "base64_code", limit: 20
    t.bigint "brand_id", null: false
    t.bigint "unit_measure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["unit_measure_id"], name: "index_products_on_unit_measure_id"
  end

  create_table "unit_measures", charset: "latin1", force: :cascade do |t|
    t.string "name", limit: 120
    t.string "iso_code", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "brands", "countries"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "unit_measures"
end
