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

ActiveRecord::Schema.define(version: 2021_09_18_211159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "longitude"
    t.integer "latitude"
    t.string "country"
    t.string "region"
    t.string "department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weather_previsions", force: :cascade do |t|
    t.date "date"
    t.bigint "city_id", null: false
    t.bigint "weather_type_id", null: false
    t.integer "temperature"
    t.integer "temperature_feels_like"
    t.bigint "wind_direction_id", null: false
    t.integer "wind_speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_weather_previsions_on_city_id"
    t.index ["weather_type_id"], name: "index_weather_previsions_on_weather_type_id"
    t.index ["wind_direction_id"], name: "index_weather_previsions_on_wind_direction_id"
  end

  create_table "weather_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wind_directions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "weather_previsions", "cities"
  add_foreign_key "weather_previsions", "weather_types"
  add_foreign_key "weather_previsions", "wind_directions"
end
