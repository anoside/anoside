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

ActiveRecord::Schema.define(version: 20130920134234) do

  create_table "languages", force: true do |t|
    t.string   "code",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["code"], name: "index_languages_on_code", unique: true, using: :btree

  create_table "languages_preferences", force: true do |t|
    t.integer  "language_id",   null: false
    t.integer  "preference_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages_preferences", ["language_id"], name: "index_languages_preferences_on_language_id", using: :btree
  add_index "languages_preferences", ["preference_id"], name: "index_languages_preferences_on_preference_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "language_id",    default: 1, null: false
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.string   "deleted_by"
    t.integer  "comments_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "posts", ["comments_count"], name: "index_posts_on_comments_count", using: :btree
  add_index "posts", ["language_id"], name: "index_posts_on_language_id", using: :btree

  create_table "preferences", force: true do |t|
    t.integer  "user_id",                             null: false
    t.boolean  "email_when_commented", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.integer  "sign_in_count",          default: 0
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
