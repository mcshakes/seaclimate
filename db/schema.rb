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

ActiveRecord::Schema.define(version: 20150501032629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trips", force: :cascade do |t|
    t.string  "long"
    t.string  "lat"
    t.text    "weather"
    t.integer "user_id"
    t.text    "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "image"
    t.text     "trip"
    t.string   "number"
  end

  create_table "weathers", force: :cascade do |t|
    t.integer  "trip_id"
    t.text     "description"
    t.float    "temp"
    t.float    "pressure"
    t.float    "wind_speed"
    t.float    "degree"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "cloud"
    t.float    "max_temp"
  end

end
