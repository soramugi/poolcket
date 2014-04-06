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

ActiveRecord::Schema.define(version: 20140406170010) do

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.string   "item_id"
    t.string   "resolved_id"
    t.string   "given_url"
    t.string   "given_title"
    t.string   "favorite"
    t.string   "status"
    t.string   "time_added"
    t.string   "time_updated"
    t.string   "time_read"
    t.string   "time_favorited"
    t.integer  "sort_id"
    t.string   "resolved_title"
    t.string   "resolved_url"
    t.string   "excerpt"
    t.string   "is_article"
    t.string   "is_index"
    t.string   "has_video"
    t.string   "has_image"
    t.string   "word_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "token"], name: "index_users_on_provider_and_token", unique: true

end
