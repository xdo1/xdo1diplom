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

ActiveRecord::Schema.define(version: 20131010130006) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_bases", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_forms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculties", force: true do |t|
    t.string   "full_name"
    t.string   "short_name"
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.integer  "department_id"
    t.integer  "course"
    t.integer  "term"
    t.boolean  "payment_format"
    t.string   "education_form"
    t.boolean  "gos3"
    t.integer  "speciality_id"
    t.integer  "students"
    t.boolean  "in_weight"
    t.string   "study_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_plans", force: true do |t|
    t.integer  "group_id"
    t.integer  "plan_id"
    t.integer  "students"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.integer  "numer"
    t.string   "education_form"
    t.string   "education_base"
    t.string   "profile_id"
    t.string   "profile_name"
    t.boolean  "filial"
    t.integer  "study_year_id"
    t.integer  "speciality_id"
    t.integer  "tp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans_study_years", force: true do |t|
    t.integer  "study_year_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualifications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role_name"
    t.integer  "role_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "specialities", force: true do |t|
    t.integer  "speciality_numer"
    t.boolean  "gos3"
    t.string   "qualification"
    t.string   "direction_name"
    t.integer  "direction_numer"
    t.string   "speciality_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_years", force: true do |t|
    t.string   "years"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "fio"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "current_role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "current_year"
  end

end
