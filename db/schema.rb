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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121215144654) do

  create_table "comment_user_codes", :force => true do |t|
    t.integer  "post_id",    :null => false
    t.integer  "user_id",    :null => false
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_user_codes", ["code"], :name => "index_comment_user_codes_on_code", :unique => true
  add_index "comment_user_codes", ["post_id", "user_id"], :name => "index_comment_user_codes_on_post_id_and_user_id", :unique => true
  add_index "comment_user_codes", ["post_id"], :name => "index_comment_user_codes_on_post_id"
  add_index "comment_user_codes", ["user_id"], :name => "index_comment_user_codes_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "relative_id",                         :null => false
    t.integer  "user_id",              :default => 0, :null => false
    t.integer  "post_id",                             :null => false
    t.integer  "comment_user_code_id",                :null => false
    t.text     "body",                                :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "comments", ["comment_user_code_id"], :name => "index_comments_on_comment_user_code_id"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_author_id"

  create_table "languages", :force => true do |t|
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "languages", ["code"], :name => "index_languages_on_code", :unique => true

  create_table "languages_preferences", :force => true do |t|
    t.integer  "language_id",   :null => false
    t.integer  "preference_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "languages_preferences", ["language_id"], :name => "index_languages_preferences_on_language_id"
  add_index "languages_preferences", ["preference_id"], :name => "index_languages_preferences_on_preference_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id",     :default => 0, :null => false
    t.integer  "language_id", :default => 1, :null => false
    t.string   "title",                      :null => false
    t.text     "body",                       :null => false
    t.string   "deleted_by"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.datetime "deleted_at"
  end

  add_index "posts", ["language_id"], :name => "index_posts_on_language_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_author_id"

  create_table "preferences", :force => true do |t|
    t.integer  "user_id",                                 :null => false
    t.boolean  "email_when_commented", :default => false, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "preferences", ["user_id"], :name => "index_preferences_on_user_id", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",                               :null => false
    t.string   "email"
    t.string   "encrypted_password",  :default => "",    :null => false
    t.boolean  "guest",               :default => false, :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["guest"], :name => "index_users_on_guest"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
