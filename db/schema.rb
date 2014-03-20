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

ActiveRecord::Schema.define(version: 20140320112423) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.string   "numer"
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
    t.string   "numer"
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
    t.string   "numer"
    t.string   "plan_name"
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

  create_table "practices", force: true do |t|
    t.date     "beginning"
    t.date     "end"
    t.string   "name"
    t.string   "reporting"
    t.integer  "weeks"
    t.integer  "ze_for_gos3"
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
    t.string   "speciality_numer"
    t.boolean  "gos3"
    t.string   "qualification"
    t.string   "direction_name"
    t.string   "direction_numer"
    t.string   "speciality_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_periods", force: true do |t|
    t.integer  "group_id"
    t.integer  "study_process_graphic_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "study_year_id"
  end

  create_table "study_periods_subjects", force: true do |t|
    t.integer  "study_period_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_process_graphics", force: true do |t|
    t.date     "semester_beginning"
    t.date     "semester_end"
    t.date     "zach_session_beginning"
    t.date     "zach_session_end"
    t.date     "exam_session_beginning"
    t.date     "exam_session_end"
    t.date     "vacation_beginning"
    t.date     "vacation_end"
    t.date     "gos_exam_beginning"
    t.date     "gos_exam_end"
    t.date     "vkr_beginning"
    t.date     "vkr_end"
    t.string   "vkr_type"
    t.string   "name"
    t.integer  "qualification_id"
    t.integer  "weeks_in_semester",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "study_year_id"
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
    t.integer  "practice_id"
  end

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "current_role"
    t.string   "current_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
