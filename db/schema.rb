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

ActiveRecord::Schema.define(:version => 20130814164038) do

  create_table "courses", :force => true do |t|
    t.string   "twilio_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "teacher_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "course_id"
    t.string   "body"
    t.date     "send_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "teacher_id"
  end

  create_table "parents", :force => true do |t|
    t.string   "class_code"
    t.string   "phone_number"
    t.string   "first_nm"
    t.string   "last_nm"
    t.string   "child_nm"
    t.string   "relationship"
    t.string   "delivery_time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "state"
  end

  create_table "replies", :force => true do |t|
    t.string   "message_id"
    t.string   "date_created"
    t.string   "date_updated"
    t.string   "account_sid"
    t.string   "from"
    t.text     "body"
    t.string   "direction"
    t.float    "price"
    t.string   "price_unit"
    t.string   "api_version"
    t.string   "uri"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "state"
  end

  create_table "schools", :force => true do |t|
    t.string   "school_number"
    t.string   "school_name"
    t.string   "instruction_type"
    t.string   "charter_type"
    t.string   "school_street_address"
    t.string   "school_city"
    t.string   "school_state"
    t.string   "school_zip"
    t.string   "school_site_street_address"
    t.string   "school_site_city"
    t.string   "school_site_state"
    t.string   "school_site_zip"
    t.string   "school_phone"
    t.string   "school_fax"
    t.string   "school_email_address"
    t.string   "school_web_page_address"
    t.string   "school_principal"
    t.string   "grade_range"
    t.string   "enrollment_as_of_oct_2012"
    t.string   "school_status"
    t.string   "school_status_date"
    t.datetime "update_date"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "full_name"
    t.string   "preferred_name"
    t.string   "phone"
    t.string   "school_name"
    t.string   "principal_name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

end
