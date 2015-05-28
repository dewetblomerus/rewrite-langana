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

ActiveRecord::Schema.define(version: 20150528103941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "profile_picture"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_references", force: :cascade do |t|
    t.integer  "employer_user_id"
    t.integer  "worker_user_id"
    t.string   "work"
    t.text     "comment"
    t.integer  "rating"
    t.boolean  "recommend"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "work_references", ["employer_user_id"], name: "index_work_references_on_employer_user_id", using: :btree
  add_index "work_references", ["worker_user_id"], name: "index_work_references_on_worker_user_id", using: :btree

  add_foreign_key "work_references", "users", column: "employer_user_id", on_delete: :cascade
  add_foreign_key "work_references", "users", column: "worker_user_id", on_delete: :cascade
end
