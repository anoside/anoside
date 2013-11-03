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

ActiveRecord::Schema.define(version: 20131103200722) do

  create_table "comments", force: true do |t|
    t.integer  "viewpoint_id", default: 0, null: false
    t.integer  "post_id",                  null: false
    t.integer  "number",                   null: false
    t.text     "body",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["viewpoint_id"], name: "index_comments_on_viewpoint_id", using: :btree

  create_table "dislikes", force: true do |t|
    t.integer  "user_id",         null: false
    t.integer  "dislikable_id",   null: false
    t.string   "dislikable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dislikes", ["dislikable_id", "dislikable_type"], name: "index_dislikes_on_dislikable_id_and_dislikable_type", using: :btree
  add_index "dislikes", ["user_id", "dislikable_id", "dislikable_type"], name: "index_dislikes_on_user_id_and_dislikable_id_and_dislikable_type", unique: true, using: :btree
  add_index "dislikes", ["user_id"], name: "index_dislikes_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["tag_id", "user_id"], name: "index_follows_on_tag_id_and_user_id", unique: true, using: :btree
  add_index "follows", ["tag_id"], name: "index_follows_on_tag_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "code",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["code"], name: "index_languages_on_code", unique: true, using: :btree

  create_table "languages_settings", force: true do |t|
    t.integer  "language_id", null: false
    t.integer  "setting_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages_settings", ["language_id"], name: "index_languages_settings_on_language_id", using: :btree
  add_index "languages_settings", ["setting_id"], name: "index_languages_settings_on_setting_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "likable_id",   null: false
    t.string   "likable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["likable_id", "likable_type"], name: "index_likes_on_likable_id_and_likable_type", using: :btree
  add_index "likes", ["user_id", "likable_id", "likable_type"], name: "index_likes_on_user_id_and_likable_id_and_likable_type", unique: true, using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "language_id",    default: 1, null: false
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.string   "deleted_by"
    t.integer  "comments_count", default: 0, null: false
    t.integer  "likes_count",    default: 0
    t.integer  "dislikes_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "posts", ["comments_count"], name: "index_posts_on_comments_count", using: :btree
  add_index "posts", ["language_id"], name: "index_posts_on_language_id", using: :btree

  create_table "settings", force: true do |t|
    t.integer  "user_id",                             null: false
    t.string   "email"
    t.boolean  "email_when_commented", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["email"], name: "index_settings_on_email", unique: true, using: :btree
  add_index "settings", ["user_id"], name: "index_settings_on_user_id", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
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

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "viewpoints", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "post_id",                    null: false
    t.string   "code",                       null: false
    t.boolean  "original",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "viewpoints", ["code"], name: "index_viewpoints_on_code", unique: true, using: :btree
  add_index "viewpoints", ["post_id"], name: "index_viewpoints_on_post_id", using: :btree
  add_index "viewpoints", ["user_id", "post_id"], name: "index_viewpoints_on_user_id_and_post_id", unique: true, using: :btree
  add_index "viewpoints", ["user_id"], name: "index_viewpoints_on_user_id", using: :btree

end
