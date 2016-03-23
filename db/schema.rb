# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160315130737) do

  create_table "carts", force: :cascade do |t|
    t.integer "visit_id"
    t.integer "item_id"
  end

  add_index "carts", ["item_id"], name: "index_carts_on_item_id"
  add_index "carts", ["visit_id"], name: "index_carts_on_visit_id"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items_visits", force: :cascade do |t|
    t.integer "visit_id"
    t.integer "item_id"
  end

  add_index "items_visits", ["item_id"], name: "index_items_visits_on_item_id"
  add_index "items_visits", ["visit_id"], name: "index_items_visits_on_visit_id"

  create_table "owners", force: :cascade do |t|
    t.text     "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "car_number"
    t.string   "car_type"
    t.string   "car_model"
    t.integer  "car_year"
    t.date     "car_next_service_date", default: '2016-08-21'
    t.integer  "car_km"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "visits", force: :cascade do |t|
    t.boolean  "open"
    t.text     "notes"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
