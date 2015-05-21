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

ActiveRecord::Schema.define(version: 20150521042142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "brewery_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", force: :cascade do |t|
    t.string   "type",        null: false
    t.integer  "volume",      null: false
    t.string   "volume_unit", null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "container",     null: false
    t.string   "room",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
    t.string   "sticker_color"
  end

  create_table "units", force: :cascade do |t|
    t.datetime "purchase_date"
    t.datetime "bottling_date"
    t.datetime "best_by_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "container_id",  null: false
    t.integer  "beer_id",       null: false
    t.string   "identifier"
    t.string   "sticker_color"
  end

end
