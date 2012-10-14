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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121014172343) do

  create_table "events", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "address"
    t.date     "begin_date"
  end

  create_table "periods", :force => true do |t|
    t.datetime "start"
    t.datetime "ends"
    t.integer  "venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "reserved"
  end

  add_index "periods", ["venue_id"], :name => "index_periods_on_venue_id"

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.integer  "period_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reservations", ["period_id"], :name => "index_reservations_on_period_id"
  add_index "reservations", ["user_id"], :name => "index_reservations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "age"
    t.text     "address"
    t.string   "city"
    t.string   "country"
    t.string   "state"
    t.string   "zip_code"
  end

  create_table "venue_images", :force => true do |t|
    t.string   "resource"
    t.integer  "venue_id_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "venue_images", ["venue_id_id"], :name => "index_venue_images_on_venue_id_id"

  create_table "venues", :force => true do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "label"
    t.text     "description"
    t.boolean  "work_place"
    t.boolean  "meals"
    t.boolean  "internet"
    t.text     "disclamer"
    t.boolean  "mates_allowed"
    t.integer  "mates_quantity"
    t.integer  "city_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "rooms"
    t.string   "address"
  end

  add_index "venues", ["city_id"], :name => "index_venues_on_city_id"
  add_index "venues", ["user_id"], :name => "index_venues_on_user_id"

end
