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

ActiveRecord::Schema.define(version: 20140724210330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id"
    t.string   "body",       null: false
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["post_id", "user_id"], name: "index_answers_on_post_id_and_user_id", unique: true, using: :btree
  add_index "answers", ["post_id"], name: "index_answers_on_post_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "board_memberships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "board_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "board_memberships", ["user_id", "board_id"], name: "index_board_memberships_on_user_id_and_board_id", unique: true, using: :btree

  create_table "boards", force: true do |t|
    t.integer  "user_id"
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "commenter_id",     null: false
    t.string   "body",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.string   "author",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["title", "user_id"], name: "index_posts_on_title_and_user_id", unique: true, using: :btree
  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
