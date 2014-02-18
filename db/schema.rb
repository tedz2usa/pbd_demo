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

ActiveRecord::Schema.define(version: 20140218014054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: true do |t|
    t.string   "display_name"
    t.string   "description"
    t.string   "link_action"
    t.string   "link_controller"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "identifier_string"
    t.integer  "menu_id"
  end

  add_index "menu_items", ["identifier_string"], name: "index_menu_items_on_identifier_string", unique: true, using: :btree

  create_table "menus", force: true do |t|
    t.string   "identifier_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["identifier_string"], name: "index_menus_on_identifier_string", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",                      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",        limit: 25
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
