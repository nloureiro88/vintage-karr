# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_28_112411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "driver_id"
    t.string "purpose"
    t.string "status", default: "active"
    t.date "bk_start"
    t.date "bk_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "bk_price"
    t.index ["car_id"], name: "index_bookings_on_car_id"
    t.index ["driver_id"], name: "index_bookings_on_driver_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "brand"
    t.string "model"
    t.string "car_type"
    t.string "fuel_type"
    t.text "description"
    t.string "car_photo"
    t.integer "year"
    t.integer "mileage"
    t.boolean "for_rental", default: true
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_cars_on_owner_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "booking_id"
    t.integer "rt_fun"
    t.integer "rt_condition"
    t.integer "rt_performance"
    t.integer "rt_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_ratings_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "photo"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "cars"
  add_foreign_key "bookings", "users", column: "driver_id"
  add_foreign_key "cars", "users", column: "owner_id"
  add_foreign_key "ratings", "bookings"
end
