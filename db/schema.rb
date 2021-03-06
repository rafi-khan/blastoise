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

ActiveRecord::Schema.define(:version => 20130428061303) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.string   "image_url"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles_readers", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "curator_id"
  end

  add_index "articles_readers", ["article_id", "curator_id"], :name => "index_articles_readers_on_article_id_and_curator_id"
  add_index "articles_readers", ["curator_id", "article_id"], :name => "index_articles_readers_on_curator_id_and_article_id"

  create_table "articles_sources", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "source_id"
  end

  add_index "articles_sources", ["article_id", "source_id"], :name => "index_articles_sources_on_article_id_and_source_id"
  add_index "articles_sources", ["source_id", "article_id"], :name => "index_articles_sources_on_source_id_and_article_id"

  create_table "readers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "about"
    t.boolean  "curator"
    t.string   "fb_id"
    t.string   "fb_access_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "readings", :force => true do |t|
    t.integer  "article_id"
    t.integer  "reader_id"
    t.datetime "first_read"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "thoughts", :force => true do |t|
    t.integer  "reading_id"
    t.datetime "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
