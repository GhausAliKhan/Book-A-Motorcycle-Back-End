ActiveRecord::Schema[7.1].define(version: 2024_01_26_092340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "motorcycles", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "chassisNumber"
    t.decimal "bookingPricePerHour"
    t.string "brand"
    t.string "model"
    t.decimal "price"
    t.text "imageLink"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chassisNumber"], name: "index_motorcycles_on_chassisNumber"
  end

  create_table "reservations", force: :cascade do |t|
    t.decimal "duration"
    t.decimal "total"
    t.bigint "user_id", null: false
    t.bigint "motorcycle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.string "city"
    t.index ["motorcycle_id"], name: "index_reservations_on_motorcycle_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
    t.text "token"
  end

  add_foreign_key "reservations", "motorcycles"
  add_foreign_key "reservations", "users"
end
