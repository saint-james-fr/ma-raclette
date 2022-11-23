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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_120120) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "raclette_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "available"
    t.index ["raclette_id"], name: "index_bookings_on_raclette_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "raclettes", force: :cascade do |t|
    t.string "location"
    t.string "photo"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_guests"
    t.string "title"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_raclettes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description", default: ""
    t.float "rating"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "phone_number"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "raclettes"
  add_foreign_key "bookings", "users"
  add_foreign_key "raclettes", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
