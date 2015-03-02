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

ActiveRecord::Schema.define(version: 20150301212931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "title",       null: false
    t.integer  "provider_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "boards", ["provider_id"], name: "index_boards_on_provider_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "title",                    null: false
    t.integer  "board_id",                 null: false
    t.text     "url"
    t.float    "ord",        default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cards", ["board_id"], name: "index_cards_on_board_id", using: :btree

  create_table "consumers", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.integer  "provider_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "birthday"
    t.integer  "gender_cd"
  end

  add_index "consumers", ["email"], name: "index_consumers_on_email", using: :btree
  add_index "consumers", ["session_token"], name: "index_consumers_on_session_token", using: :btree

  create_table "issues", force: :cascade do |t|
    t.integer  "card_id",     null: false
    t.integer  "consumer_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "issues", ["card_id", "consumer_id"], name: "index_issues_on_card_id_and_consumer_id", unique: true, using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "card_id",                     null: false
    t.integer  "consumer_id",                 null: false
    t.boolean  "done",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "likes", ["card_id"], name: "index_likes_on_card_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "trelloName"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "providers", ["email"], name: "index_providers_on_email", using: :btree
  add_index "providers", ["session_token"], name: "index_providers_on_session_token", using: :btree

  create_table "shared_boards", force: :cascade do |t|
    t.integer  "consumer_id", null: false
    t.integer  "board_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shared_boards", ["consumer_id", "board_id"], name: "index_shared_boards_on_consumer_id_and_board_id", unique: true, using: :btree

end
