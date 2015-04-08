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

ActiveRecord::Schema.define(version: 20150408200901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_interests", force: true do |t|
    t.integer  "location_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_interests_count", default: 0, null: false
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_url"
    t.string   "email_address"
    t.text     "looking_for"
    t.text     "best_at"
    t.string   "resume_url"
    t.integer  "cohort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github_url"
    t.string   "slug"
    t.string   "resume"
    t.integer  "user_id"
    t.string   "photo_slug"
    t.boolean  "hidden",        default: false
    t.text     "introduction"
    t.boolean  "hired",         default: false
    t.text     "hired_by"
    t.integer  "github_id"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github_url"
    t.text     "my_focus"
    t.string   "code_climate_badge_url"
    t.string   "travis_ci_badge_url"
    t.string   "screenshot"
    t.string   "production_url"
  end

end
