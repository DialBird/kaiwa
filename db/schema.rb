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

ActiveRecord::Schema.define(version: 2018_11_14_100242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.integer "goal_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "memo", default: "", null: false
    t.integer "star", default: 0, null: false
    t.integer "logs_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "memo", default: "", null: false
    t.integer "star", default: 0, null: false
    t.text "review", default: "", null: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "detail", default: "", null: false
    t.boolean "is_clear", default: false, null: false
    t.date "limit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habits", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "memo", default: "", null: false
    t.boolean "is_clear", default: false, null: false
    t.integer "logs_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "logable_type"
    t.bigint "logable_id", comment: "ポリモーフィックID"
    t.integer "event_id", default: 0, null: false
    t.text "memo", default: "", null: false
    t.integer "star", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logable_type", "logable_id", "event_id"], name: "index_logs_on_logable_type_and_logable_id_and_event_id", unique: true
    t.index ["logable_type", "logable_id"], name: "index_logs_on_logable_type_and_logable_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "action_id", default: 0, null: false
    t.integer "event_id", default: 0, null: false
    t.boolean "is_done", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id", "event_id"], name: "index_plans_on_action_id_and_event_id", unique: true
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
    t.string "aasm_state", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "nick_name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "by_uid", unique: true
  end

  add_foreign_key "actions", "goals", name: "actions_goal_id_fk"
  add_foreign_key "events", "users", name: "events_user_id_fk"
  add_foreign_key "goals", "users", name: "goals_user_id_fk"
  add_foreign_key "habits", "users", name: "habits_user_id_fk"
  add_foreign_key "logs", "events", name: "logs_event_id_fk"
  add_foreign_key "plans", "actions", name: "plans_action_id_fk"
  add_foreign_key "plans", "events", name: "plans_event_id_fk"
end
