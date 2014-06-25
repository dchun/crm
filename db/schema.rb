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

ActiveRecord::Schema.define(version: 20140625063201) do

  create_table "acceptable_contact_positions", force: true do |t|
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acceptable_contact_roles", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acceptable_contact_salutations", force: true do |t|
    t.string   "salutation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "salutation"
    t.string   "position"
    t.string   "role"
    t.boolean  "complete"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["school_id"], name: "index_contacts_on_school_id"

  create_table "districts", force: true do |t|
    t.string   "state"
    t.string   "name"
    t.float    "college_readiness_score"
    t.float    "tested_ap"
    t.float    "passed_ap"
    t.float    "math_score"
    t.float    "math_proficient"
    t.float    "math_not_proficient"
    t.float    "reading_score"
    t.float    "reading_proficient"
    t.float    "reading_not_proficient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.integer  "state_rank"
    t.integer  "national_rank"
    t.float    "college_readiness_score"
    t.float    "tested_ap_ib"
    t.float    "pass_ap_ib"
    t.float    "math_score"
    t.float    "math_proficient"
    t.float    "math_not_proficient"
    t.float    "reading_score"
    t.float    "reading_proficient"
    t.float    "reading_not_proficient"
    t.string   "student_teacher_ratio"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "total_enrollment"
    t.float    "total_economically_disadvantaged"
    t.boolean  "receives_title_i_funding"
    t.float    "ap_student_performance_participation_rate"
    t.float    "ap_student_performance_participant_passing_rate"
    t.float    "ap_student_performance_exam_per_test_taker"
    t.float    "ap_student_performance_exam_pass_rate"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["district_id"], name: "index_schools_on_district_id"

end
