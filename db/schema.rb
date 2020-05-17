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

ActiveRecord::Schema.define(version: 2020_05_17_075832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.text "answer_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "plan_date"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "sex"
    t.string "category"
    t.text "self_introduction"
    t.text "service_name"
    t.integer "price"
    t.string "bank"
    t.string "branch"
    t.integer "branch_number"
    t.string "account"
    t.integer "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "professional_image"
  end

  create_table "promises", force: :cascade do |t|
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_promises_on_category_id"
    t.index ["user_id"], name: "index_promises_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "detail"
    t.string "answer_right"
    t.string "answer_left"
    t.integer "beginner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "user_matches", force: :cascade do |t|
    t.integer "confirmation_status"
    t.datetime "confirmation_date"
    t.bigint "party_id"
    t.bigint "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_user_matches_on_partner_id"
    t.index ["party_id"], name: "index_user_matches_on_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "sex"
    t.string "material_status"
    t.integer "birthday"
    t.string "blood_type"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "promises", "categories"
  add_foreign_key "promises", "users"
  add_foreign_key "questions", "categories"
  add_foreign_key "user_matches", "users", column: "partner_id"
  add_foreign_key "user_matches", "users", column: "party_id"
end
