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

ActiveRecord::Schema.define(version: 2021_09_25_195355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.string "country"
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_cities_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "temperature_records", force: :cascade do |t|
    t.integer "month"
    t.integer "temp_min"
    t.integer "temp_max"
    t.integer "temp_average"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_temperature_records_on_department_id"
  end

  create_table "weather_previsions", force: :cascade do |t|
    t.date "date"
    t.bigint "city_id", null: false
    t.bigint "weather_type_id", null: false
    t.integer "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_weather_previsions_on_city_id"
    t.index ["weather_type_id"], name: "index_weather_previsions_on_weather_type_id"
  end

  create_table "weather_types", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.integer "temperature_max"
    t.integer "temperature_min"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cities", "departments"
  add_foreign_key "temperature_records", "departments"
  add_foreign_key "weather_previsions", "cities"
  add_foreign_key "weather_previsions", "weather_types"
end
