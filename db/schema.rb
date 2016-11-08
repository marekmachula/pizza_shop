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

ActiveRecord::Schema.define(version: 20161108163206) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "pizza_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "components", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components_pizzas", id: false, force: :cascade do |t|
    t.integer "pizza_id",     null: false
    t.integer "component_id", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "pizza_name"
    t.decimal  "pizza_price"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "order_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.decimal  "promo_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "street"
    t.string   "city"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
