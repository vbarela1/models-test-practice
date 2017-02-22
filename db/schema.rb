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

ActiveRecord::Schema.define(version: 20170221211331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "age"
    t.float    "price"
    t.integer  "mileage"
    t.string   "color"
    t.string   "interior"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "warranty"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "population"
    t.string   "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "serial_number"
    t.string   "name"
    t.integer  "car_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["car_id"], name: "index_parts_on_car_id", using: :btree
  end

  create_table "robots", force: :cascade do |t|
    t.string   "name"
    t.string   "serial"
    t.boolean  "friendly"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "inventor_id"
    t.index ["inventor_id"], name: "index_robots_on_inventor_id", using: :btree
  end

  add_foreign_key "parts", "cars"
  add_foreign_key "robots", "inventors"
end
