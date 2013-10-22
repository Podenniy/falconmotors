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

ActiveRecord::Schema.define(version: 20131022174339) do

  create_table "brends", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "supplier_id"
    t.integer  "spare_part_id"
  end

  add_index "brends", ["title"], name: "index_brends_on_title", using: :btree

  create_table "brends_suppliers", force: true do |t|
    t.integer "brend_id"
    t.integer "supplier_id"
  end

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

  create_table "delivery_methods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "spare_part_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",                               default: 1
    t.integer  "order_id"
    t.integer  "price_part_id"
    t.decimal  "price",         precision: 10, scale: 0
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.string   "delivery_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pyment_type_id"
    t.integer  "delivery_method_id"
  end

  create_table "price_parts", force: true do |t|
    t.decimal  "price",         precision: 8, scale: 2
    t.integer  "delivery"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.integer  "spare_part_id"
  end

  create_table "pyment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "spare_parts", force: true do |t|
    t.string   "title"
    t.text     "descriptions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "quantity",     default: 0
    t.integer  "category_id"
    t.integer  "brend_id"
    t.integer  "parent_id"
  end

  add_index "spare_parts", ["title"], name: "index_spare_parts_on_title", using: :btree

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
