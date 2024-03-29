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

ActiveRecord::Schema[7.0].define(version: 2023_01_27_191730) do
  create_table "court_availabilities", charset: "utf8mb4", force: :cascade do |t|
    t.integer "court_id"
    t.date "date_slot"
    t.string "time_slots"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reservation_id"
  end

  create_table "courts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "postcode"
    t.string "format"
    t.string "surface"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "game_type"
  end

  create_table "reservations", charset: "utf8mb4", force: :cascade do |t|
    t.date "play_date"
    t.string "status"
    t.integer "court_id"
    t.integer "user_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "private_api_key_ciphertext"
    t.string "private_api_key_bidx"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["private_api_key_bidx"], name: "index_users_on_private_api_key_bidx", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
