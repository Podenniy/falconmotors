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

ActiveRecord::Schema.define(version: 20131007092429) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "line_items", force: true do |t|
    t.integer  "spare_part_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",                               default: 1
    t.decimal  "price",         precision: 10, scale: 0
  end

  create_table "spare_parts", force: true do |t|
    t.string   "title"
    t.text     "descriptions"
    t.decimal  "price",        precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "quantity",                             default: 0
    t.integer  "category_id"
  end

  add_index "spare_parts", ["price"], name: "index_spare_parts_on_price", using: :btree
  add_index "spare_parts", ["title"], name: "index_spare_parts_on_title", using: :btree

end
