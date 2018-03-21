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

ActiveRecord::Schema.define(version: 20180316001456) do

  create_table "careers", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ejs", force: :cascade do |t|
    t.string "title"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_ejs_on_university_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.datetime "birthday"
    t.text "description"
    t.string "gender"
    t.string "orientation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "career_id"
    t.integer "university_id"
    t.string "password_digest"
    t.index ["career_id"], name: "index_students_on_career_id"
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
