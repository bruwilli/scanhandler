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

ActiveRecord::Schema.define(:version => 20140131134304) do

  create_table "name_groups", :force => true do |t|
    t.string "names"
  end

  create_table "nickname_trigrams", :force => true do |t|
    t.string  "tg"
    t.integer "nickname_id"
  end

  add_index "nickname_trigrams", ["nickname_id"], :name => "index_nickname_trigrams_on_nickname_id"

  create_table "nicknames", :force => true do |t|
    t.string  "name"
    t.integer "name_group_id"
  end

  add_index "nicknames", ["name_group_id"], :name => "index_nicknames_on_name_group_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "cal_south_id"
  end

  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "people_first_name_trigrams", :force => true do |t|
    t.integer "person_id", :null => false
    t.string  "tg",        :null => false
  end

  add_index "people_first_name_trigrams", ["person_id"], :name => "index_people_first_name_trigrams_on_person_id"
  add_index "people_first_name_trigrams", ["tg"], :name => "index_people_first_name_trigrams_on_tg"

  create_table "people_last_name_trigrams", :force => true do |t|
    t.integer "person_id", :null => false
    t.string  "tg",        :null => false
  end

  add_index "people_last_name_trigrams", ["person_id"], :name => "index_people_last_name_trigrams_on_person_id"
  add_index "people_last_name_trigrams", ["tg"], :name => "index_people_last_name_trigrams_on_tg"

  create_table "person_notes", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "person_notes", ["person_id"], :name => "index_person_notes_on_person_id"
  add_index "person_notes", ["user_id"], :name => "index_person_notes_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "scans", :force => true do |t|
    t.integer  "user_id"
    t.integer  "person_id"
    t.date     "scan_date"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "scans", ["person_id"], :name => "index_scans_on_person_id"
  add_index "scans", ["user_id"], :name => "index_scans_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",   :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.boolean  "send_notification",                    :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
