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

ActiveRecord::Schema.define(version: 2023_03_03_004106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breweries", force: :cascade do |t|
    t.string "brew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "trails", force: :cascade do |t|
    t.string "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "user_breweries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brewery_id"], name: "index_user_breweries_on_brewery_id"
    t.index ["user_id"], name: "index_user_breweries_on_user_id"
  end

  create_table "user_trails", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trail_id"], name: "index_user_trails_on_trail_id"
    t.index ["user_id"], name: "index_user_trails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "google_id"
    t.string "first_name"
    t.string "last_name"
    t.string "google_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "user_breweries", "breweries"
  add_foreign_key "user_breweries", "users"
  add_foreign_key "user_trails", "trails"
  add_foreign_key "user_trails", "users"
end
