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

ActiveRecord::Schema.define(version: 20130921191155) do

  create_table "climbs", force: true do |t|
    t.integer  "user_id"
    t.integer  "problem_id"
    t.datetime "attempted_on"
    t.boolean  "success",      default: true
    t.string   "grade"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "climbs", ["problem_id"], name: "index_climbs_on_problem_id", using: :btree
  add_index "climbs", ["user_id"], name: "index_climbs_on_user_id", using: :btree

  create_table "gyms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "gym_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["gym_id"], name: "index_memberships_on_gym_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "problems", force: true do |t|
    t.integer  "gym_id"
    t.boolean  "active"
    t.string   "name"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.integer  "height"
  end

  add_index "problems", ["gym_id"], name: "index_problems_on_gym_id", using: :btree

  create_table "tags", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["user_id"], name: "index_tags_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_id"
    t.string   "grade"
  end

end
