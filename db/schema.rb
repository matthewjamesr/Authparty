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

ActiveRecord::Schema.define(version: 20161210192031) do

  create_table "accounts", force: :cascade do |t|
    t.string   "public_key"
    t.string   "broadcast_code"
    t.boolean  "is_broadcasted",       default: false, null: false
    t.string   "providers_authorized"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "logged_out_at"
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "provider_id"
    t.datetime "connected_on"
    t.string   "bearer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["account_id"], name: "index_connections_on_account_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "api_key"
    t.string   "callback_url"
    t.string   "contact_email"
    t.string   "logo"
    t.integer  "number_connected", default: 0
    t.integer  "tokens",           default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "api_secret"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "name"
    t.string   "description"
    t.integer  "holders"
    t.integer  "supply"
    t.boolean  "locked"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provider_id"], name: "index_tokens_on_provider_id"
  end

end
