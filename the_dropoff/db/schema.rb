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

ActiveRecord::Schema.define(version: 20140830211023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: true do |t|
    t.string   "position"
    t.string   "name"
    t.string   "team"
    t.integer  "projection"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dropoff"
    t.boolean  "drafted"
    t.integer  "total_offense"
    t.integer  "perc_contribute"
    t.integer  "offense_percentile"
    t.integer  "defense_percentile"
    t.integer  "o_d_delta"
    t.boolean  "offense",            default: true
  end

end
