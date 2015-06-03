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

ActiveRecord::Schema.define(version: 20150603172920) do

  create_table "action_members", force: true do |t|
    t.string "id_action"
    t.string "id_user"
    t.string "date_prepay"
    t.string "prepay"
  end

  create_table "action_prices", force: true do |t|
    t.string "id_name"
    t.string "date"
    t.string "cost"
  end

  create_table "actions", force: true do |t|
    t.string "name"
    t.string "description"
    t.string "city"
    t.string "name_master"
    t.string "date_start"
    t.string "date_finish"
    t.string "prepay"
  end

  add_index "actions", ["city"], name: "index_actions_on_city"
  add_index "actions", ["name"], name: "index_actions_on_name"
  add_index "actions", ["name_master"], name: "index_actions_on_name_master"

  create_table "event_templates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "city"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.decimal  "prepay_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_template_id"
  end

  add_index "events", ["event_template_id"], name: "index_events_on_event_template_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "surname"
    t.string   "patronymic"
    t.string   "gender"
    t.string   "birthday"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "mobtel"
    t.string   "skype"
    t.string   "vk"
    t.string   "comment"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
