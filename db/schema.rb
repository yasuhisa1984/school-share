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

ActiveRecord::Schema.define(version: 20180618222742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name", null: false
    t.string "postalcode"
    t.string "area"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_addresses_on_school_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price"
    t.string "period"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "post_purposes", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "purpose_id"], name: "index_post_purposes_on_post_id_and_purpose_id", unique: true
    t.index ["post_id"], name: "index_post_purposes_on_post_id"
    t.index ["purpose_id"], name: "index_post_purposes_on_purpose_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "work"
    t.text "story"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.bigint "course_id", null: false
    t.bigint "school_period_id"
    t.index ["course_id"], name: "index_posts_on_course_id"
    t.index ["school_id"], name: "index_posts_on_school_id"
    t.index ["school_period_id"], name: "index_posts_on_school_period_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_purposes_on_name", unique: true
  end

  create_table "school_periods", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_purposes", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purpose_id"], name: "index_school_purposes_on_purpose_id"
    t.index ["school_id"], name: "index_school_purposes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.text "description"
    t.boolean "remote", default: false, null: false
    t.string "school_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "point", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "skill_id"
    t.index ["skill_id"], name: "index_scores_on_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "post_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_skills_on_post_id"
    t.index ["school_id"], name: "index_skills_on_school_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.integer "age"
    t.string "gender"
    t.text "history"
    t.text "future"
    t.boolean "admin", default: false
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "image_url"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "addresses", "schools"
  add_foreign_key "courses", "schools"
  add_foreign_key "post_purposes", "posts"
  add_foreign_key "post_purposes", "purposes"
  add_foreign_key "posts", "courses"
  add_foreign_key "posts", "school_periods"
  add_foreign_key "posts", "schools"
  add_foreign_key "school_purposes", "purposes"
  add_foreign_key "school_purposes", "schools"
  add_foreign_key "scores", "skills"
  add_foreign_key "skills", "posts"
  add_foreign_key "skills", "schools"
end
