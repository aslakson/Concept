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

ActiveRecord::Schema.define(:version => 20120109202459) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["name"], :name => "index_activities_on_name", :unique => true

  create_table "activities_venues", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "venue_id"
  end

  add_index "activities_venues", ["activity_id", "venue_id"], :name => "index_activities_venues_on_activity_id_and_venue_id", :unique => true

  create_table "activity_venues", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ammenities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ammenities", ["name"], :name => "index_ammenities_on_name", :unique => true

  create_table "ammenities_venues", :id => false, :force => true do |t|
    t.integer "ammenity_id"
    t.integer "venue_id"
  end

  add_index "ammenities_venues", ["ammenity_id", "venue_id"], :name => "index_ammenities_venues_on_ammenity_id_and_venue_id", :unique => true

  create_table "ammenity_venues", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facet_venues", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facets_venues", :id => false, :force => true do |t|
    t.integer "facet_id"
    t.integer "venue_id"
  end

  add_index "facets_venues", ["facet_id", "venue_id"], :name => "index_facets_venues_on_facet_id_and_venue_id", :unique => true

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "telephone"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "gmaps"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "locations", ["city"], :name => "index_locations_on_city"
  add_index "locations", ["lat"], :name => "index_locations_on_lat"
  add_index "locations", ["lng"], :name => "index_locations_on_lng"
  add_index "locations", ["name"], :name => "index_locations_on_name"
  add_index "locations", ["organization_id"], :name => "index_locations_on_organization_id"
  add_index "locations", ["state"], :name => "index_locations_on_state"
  add_index "locations", ["zip_code"], :name => "index_locations_on_zip_code"

  create_table "organization_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_users", :force => true do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "organization_users", ["organization_id", "user_id", "role_id"], :name => "org_user_role", :unique => true

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "organization_type_id"
    t.text     "description"
    t.string   "url"
    t.string   "email"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "telephone"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "organizations", ["city"], :name => "index_organizations_on_city"
  add_index "organizations", ["email"], :name => "index_organizations_on_email", :unique => true
  add_index "organizations", ["lat"], :name => "index_organizations_on_lat"
  add_index "organizations", ["lng"], :name => "index_organizations_on_lng"
  add_index "organizations", ["name"], :name => "index_organizations_on_name"
  add_index "organizations", ["state"], :name => "index_organizations_on_state"
  add_index "organizations", ["zip_code"], :name => "index_organizations_on_zip_code"

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures_venues", :id => false, :force => true do |t|
    t.integer "picture_id"
    t.integer "venue_id"
  end

  add_index "pictures_venues", ["picture_id", "venue_id"], :name => "index_pictures_venues_on_picture_id_and_venue_id", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "searches", :force => true do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_venues", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["name"], :name => "index_services_on_name", :unique => true

  create_table "services_venues", :force => true do |t|
    t.integer "service_id"
    t.integer "venue_id"
    t.integer "price"
  end

  add_index "services_venues", ["service_id", "venue_id"], :name => "index_services_venues_on_service_id_and_venue_id", :unique => true

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "ansi_code"
    t.string   "statens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zip_code"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.string   "url"
    t.string   "email"
    t.integer  "hourly_rate"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "venues", ["email"], :name => "index_venues_on_email"
  add_index "venues", ["location_id"], :name => "index_venues_on_location_id"
  add_index "venues", ["name"], :name => "index_venues_on_name"

end
