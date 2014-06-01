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

ActiveRecord::Schema.define(version: 20140601152536) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.boolean  "income",                          default: false
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wallet_id"
    t.integer  "transaction_id"
    t.text     "description",    limit: 16777215
    t.integer  "location_id"
    t.integer  "category_id"
  end

  create_table "user_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
  end

  create_table "wallets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "amount"
    t.integer  "currency_id", limit: 2, default: 1,    null: false
    t.integer  "wallet_id"
    t.boolean  "current",               default: true
  end

  add_index "wallets", ["currency_id"], name: "currency_id", using: :btree
  add_index "wallets", ["user_id", "current"], name: "index_wallets_on_user_id_and_current", unique: true, using: :btree
  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

end
