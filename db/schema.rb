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

ActiveRecord::Schema.define(version: 20160325055729) do

  create_table "candidate_skills", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "candidate_id", null: false
    t.integer  "skill_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "email",                          null: false
    t.string   "phone"
    t.string   "about"
    t.string   "linkedin_link"
    t.string   "facebook_link"
    t.string   "image"
    t.integer  "status",             default: 0, null: false
    t.integer  "company_id"
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_locations", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "company_locations", ["company_id"], name: "index_company_locations_on_company_id"
  add_index "company_locations", ["location_id"], name: "index_company_locations_on_location_id"

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "salary"
    t.integer  "company_id"
    t.integer  "candidate_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "company_id"
    t.integer  "job_id"
    t.integer  "user_id",      null: false
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "job_id",                   null: false
    t.integer  "candidate_id",             null: false
    t.integer  "user_id",                  null: false
    t.integer  "status",       default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
