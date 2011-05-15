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

ActiveRecord::Schema.define(:version => 7) do

  create_table "accounts", :force => true do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "crypted_password"
    t.string "role"
  end

  create_table "auditions", :force => true do |t|
    t.string   "title",        :null => false
    t.datetime "vote_from",    :null => false
    t.datetime "vote_until"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates", :force => true do |t|
    t.integer  "audition_id",                  :null => false
    t.integer  "user_id",                      :null => false
    t.string   "title",                        :null => false
    t.integer  "display_order", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supporters", :force => true do |t|
    t.integer  "team_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "twitter_id",                     :null => false
    t.string   "screen_name"
    t.string   "token",                          :null => false
    t.string   "secret",                         :null => false
    t.integer  "team_id"
    t.integer  "point",       :default => 0,     :null => false
    t.boolean  "is_admin",    :default => false, :null => false
    t.integer  "invited_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "candidate_id", :null => false
    t.integer  "user_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
