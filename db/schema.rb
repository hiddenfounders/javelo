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

ActiveRecord::Schema.define(version: 20180309114657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_invited", default: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_departments_on_account_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "due_date"
    t.integer "status", default: 0
    t.decimal "progress", default: "0.0"
    t.string "milestones", array: true
    t.integer "priorities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.bigint "objective_id"
    t.integer "account_id"
    t.jsonb "json_milestones", default: "{}"
    t.index ["department_id"], name: "index_objectives_on_department_id"
    t.index ["objective_id"], name: "index_objectives_on_objective_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_organizations_on_account_id"
  end

end
