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

ActiveRecord::Schema.define(version: 2018_09_21_155144) do

  create_table "bins", force: :cascade do |t|
    t.text "name"
    t.integer "bushel_capacity"
    t.integer "per_cent_full"
    t.integer "user_id"
    t.integer "load_id"
  end

  create_table "loads", force: :cascade do |t|
    t.string "driver_name"
    t.integer "load_in_weight"
    t.integer "load_out_weight"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "password"
  end

end
