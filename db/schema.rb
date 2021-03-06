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

ActiveRecord::Schema.define(version: 20151103121754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "doors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "floors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "number_of_toys", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "email"
    t.boolean  "open",           default: true
    t.integer  "floor_id"
    t.integer  "door_id"
  end

  add_index "rooms", ["door_id"], name: "index_rooms_on_door_id", using: :btree
  add_index "rooms", ["floor_id"], name: "index_rooms_on_floor_id", using: :btree

  create_table "toys", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.decimal  "price",         precision: 10, scale: 2
    t.integer  "available_num"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "room_id"
    t.boolean  "active",                                 default: true
    t.string   "image"
  end

  add_index "toys", ["name"], name: "index_toys_on_name", using: :btree
  add_index "toys", ["room_id"], name: "index_toys_on_room_id", using: :btree

  add_foreign_key "rooms", "doors"
  add_foreign_key "rooms", "floors"
  add_foreign_key "toys", "rooms"
end
