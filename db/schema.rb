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

ActiveRecord::Schema.define(:version => 20130913174749) do

  create_table "bills", :force => true do |t|
    t.string   "name"
    t.string   "rfc"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "branch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bills", ["branch_id"], :name => "index_bills_on_branch_id"
  add_index "bills", ["client_id"], :name => "index_bills_on_client_id"
  add_index "bills", ["company_id"], :name => "index_bills_on_company_id"

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "email1"
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "branches", ["company_id"], :name => "index_branches_on_company_id"

  create_table "cellphones", :force => true do |t|
    t.string   "phone_number"
    t.string   "model"
    t.string   "brand"
    t.string   "color"
    t.string   "ope_system"
    t.text     "condition"
    t.string   "imei"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cellphones", ["branch_id"], :name => "index_cellphones_on_branch_id"
  add_index "cellphones", ["company_id"], :name => "index_cellphones_on_company_id"
  add_index "cellphones", ["user_id"], :name => "index_cellphones_on_user_id"

  create_table "client_branches", :force => true do |t|
    t.string   "name"
    t.string   "email1"
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.text     "description"
    t.integer  "client_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "client_branches", ["branch_id"], :name => "index_client_branches_on_branch_id"
  add_index "client_branches", ["client_id"], :name => "index_client_branches_on_client_id"
  add_index "client_branches", ["company_id"], :name => "index_client_branches_on_company_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email1"
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.text     "description"
    t.integer  "company_id"
    t.integer  "branch_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "clients", ["branch_id"], :name => "index_clients_on_branch_id"
  add_index "clients", ["company_id"], :name => "index_clients_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "email1"
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "drivers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "truck_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "drivers", ["branch_id"], :name => "index_drivers_on_branch_id"
  add_index "drivers", ["company_id"], :name => "index_drivers_on_company_id"
  add_index "drivers", ["truck_id"], :name => "index_drivers_on_truck_id"
  add_index "drivers", ["user_id"], :name => "index_drivers_on_user_id"

  create_table "error_reports", :force => true do |t|
    t.string   "user"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "line_number"
    t.string   "referrer_url"
    t.string   "original_path"
    t.string   "environment"
    t.integer  "branch_id"
    t.text     "description"
    t.text     "backtrace"
    t.date     "error_time"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "error_reports", ["branch_id"], :name => "index_error_reports_on_branch_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "protected"
    t.boolean  "super_admin"
    t.boolean  "branch_admin"
    t.boolean  "routes_admin"
    t.boolean  "driver"
    t.text     "description"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "roles", ["branch_id"], :name => "index_roles_on_branch_id"
  add_index "roles", ["company_id"], :name => "index_roles_on_company_id"

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.integer  "schedule_id"
    t.integer  "company_id"
    t.integer  "branch_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "routes", ["branch_id"], :name => "index_routes_on_branch_id"
  add_index "routes", ["company_id"], :name => "index_routes_on_company_id"
  add_index "routes", ["schedule_id"], :name => "index_routes_on_schedule_id"

  create_table "schedules", :force => true do |t|
    t.integer  "company_id"
    t.integer  "branch_id"
    t.integer  "driver_id"
    t.integer  "client_id"
    t.integer  "client_branch_id"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "schedules", ["branch_id"], :name => "index_schedules_on_branch_id"
  add_index "schedules", ["client_branch_id"], :name => "index_schedules_on_client_branch_id"
  add_index "schedules", ["client_id"], :name => "index_schedules_on_client_id"
  add_index "schedules", ["company_id"], :name => "index_schedules_on_company_id"
  add_index "schedules", ["driver_id"], :name => "index_schedules_on_driver_id"

  create_table "schedules_routes", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "route_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "schedules_routes", ["route_id"], :name => "index_schedules_routes_on_route_id"
  add_index "schedules_routes", ["schedule_id"], :name => "index_schedules_routes_on_schedule_id"

  create_table "trucks", :force => true do |t|
    t.string   "model"
    t.string   "brand"
    t.integer  "year"
    t.string   "truck_type"
    t.string   "plate_no"
    t.string   "serial_no"
    t.string   "color"
    t.integer  "wheels_no"
    t.string   "other"
    t.string   "identifier"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trucks", ["branch_id"], :name => "index_trucks_on_branch_id"
  add_index "trucks", ["company_id"], :name => "index_trucks_on_company_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.integer  "role_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.boolean  "active"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username",                               :null => false
    t.string   "email",                                  :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["branch_id"], :name => "index_users_on_branch_id"
  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
