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

ActiveRecord::Schema.define(:version => 20120707191948) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipCode"
    t.string   "date_deleted"
    t.integer  "is_deleted"
    t.integer  "family_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "name"
  end

  add_index "addresses", ["family_id"], :name => "index_addresses_on_family_id"

  create_table "comments", :force => true do |t|
    t.string   "value"
    t.integer  "family_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["family_id"], :name => "index_comments_on_family_id"

  create_table "emails", :force => true do |t|
    t.string   "value"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emails", ["person_id"], :name => "index_emails_on_person_id"

  create_table "families", :force => true do |t|
    t.integer  "comments_id"
    t.integer  "families_id"
    t.integer  "addresses_id"
    t.integer  "tags_id"
    t.string   "anniversary"
    t.integer  "phoneNumbers_id"
    t.string   "date_deleted"
    t.integer  "is_deleted"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
  end

  add_index "families", ["addresses_id"], :name => "index_families_on_addresses_id"
  add_index "families", ["comments_id"], :name => "index_families_on_comments_id"
  add_index "families", ["families_id"], :name => "index_families_on_famlies_id"
  add_index "families", ["phoneNumbers_id"], :name => "index_families_on_phoneNumbers_id"
  add_index "families", ["tags_id"], :name => "index_families_on_tags_id"

  create_table "people", :force => true do |t|
    t.string   "firstName"
    t.string   "middleName"
    t.string   "lastName"
    t.integer  "family_id"
    t.integer  "emails_id"
    t.integer  "phoneNumbers_id"
    t.integer  "tags_id"
    t.string   "birthday"
    t.string   "date_deleted"
    t.integer  "is_deleted"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "nickname"
  end

  add_index "people", ["emails_id"], :name => "index_people_on_emails_id"
  add_index "people", ["family_id"], :name => "index_people_on_family_id"
  add_index "people", ["phoneNumbers_id"], :name => "index_people_on_phoneNumbers_id"
  add_index "people", ["tags_id"], :name => "index_people_on_tags_id"

  create_table "phone_numbers", :force => true do |t|
    t.string   "value"
    t.integer  "person_id"
    t.integer  "family_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "phone_numbers", ["family_id"], :name => "index_phone_numbers_on_family_id"
  add_index "phone_numbers", ["person_id"], :name => "index_phone_numbers_on_person_id"

  create_table "tags", :force => true do |t|
    t.string   "value"
    t.integer  "family_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["family_id"], :name => "index_tags_on_family_id"

end
