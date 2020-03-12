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

ActiveRecord::Schema.define(version: 2020_03_11_224438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "content"
    t.integer "source_id"
    t.string "url_to_image"
    t.string "description"
    t.string "author"
    t.string "published_at"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "api_id"
    t.string "url"
  end

  create_table "stash_articles", force: :cascade do |t|
    t.integer "stash_id"
    t.integer "article_id"
  end

  create_table "stashes", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "stream_sources", force: :cascade do |t|
    t.integer "stream_id"
    t.integer "source_id"
  end

  create_table "streams", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean "dark_mode", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
