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

ActiveRecord::Schema.define(version: 20170324201639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.string   "breed"
    t.boolean  "vaccinated"
    t.boolean  "neutered"
    t.integer  "weight"
    t.string   "temperament"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_dogs_on_user_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "playdate_id"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["playdate_id"], name: "index_invites_on_playdate_id", using: :btree
    t.index ["user_id"], name: "index_invites_on_user_id", using: :btree
  end

  create_table "playdates", force: :cascade do |t|
    t.string   "location"
    t.datetime "date"
    t.string   "description"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_playdates_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "dogs", "users"
  add_foreign_key "invites", "playdates"
  add_foreign_key "invites", "users"
  add_foreign_key "playdates", "users"
end
