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

ActiveRecord::Schema.define(version: 20140328005526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "graph_tags", force: true do |t|
    t.integer  "tag_id"
    t.integer  "graph_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "graph_tags", ["graph_id"], name: "index_graph_tags_on_graph_id", using: :btree
  add_index "graph_tags", ["tag_id"], name: "index_graph_tags_on_tag_id", using: :btree

  create_table "graphs", force: true do |t|
    t.string   "name"
    t.string   "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "graphs", ["post_id"], name: "index_graphs_on_post_id", using: :btree

  create_table "post_tickets", force: true do |t|
    t.integer  "post_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_tickets", ["post_id"], name: "index_post_tickets_on_post_id", using: :btree
  add_index "post_tickets", ["ticket_id"], name: "index_post_tickets_on_ticket_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_publish",  default: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_tags", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_tags", ["tag_id"], name: "index_ticket_tags_on_tag_id", using: :btree
  add_index "ticket_tags", ["ticket_id"], name: "index_ticket_tags_on_ticket_id", using: :btree

  create_table "tickets", force: true do |t|
    t.string   "user"
    t.text     "content"
    t.string   "browser"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "tickets", ["category_id"], name: "index_tickets_on_category_id", using: :btree
  add_index "tickets", ["subcategory_id"], name: "index_tickets_on_subcategory_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "department_code"
  end

end
