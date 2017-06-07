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

ActiveRecord::Schema.define(version: 20170606153606) do

  create_table "comments", force: :cascade do |t|
    t.integer  "troll_id"
    t.datetime "date"
    t.string   "domain_prefix"
    t.string   "url"
    t.string   "text"
    t.integer  "comment_id"
    t.integer  "text_size"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["comment_id"], name: "index_comments_on_comment_id"
    t.index ["domain_prefix"], name: "index_comments_on_domain_prefix"
    t.index ["troll_id"], name: "index_comments_on_troll_id"
  end

  create_table "threads_pad_job_logs", force: :cascade do |t|
    t.integer  "job_reflection_id"
    t.integer  "level"
    t.integer  "group_id"
    t.text     "msg"
    t.datetime "created_at",        null: false
    t.index ["job_reflection_id"], name: "index_threads_pad_job_logs_on_job_reflection_id"
  end

  create_table "threads_pad_jobs", force: :cascade do |t|
    t.boolean "terminated"
    t.string  "thread_id"
    t.boolean "done"
    t.string  "result"
    t.integer "group_id"
    t.integer "integer"
    t.integer "max"
    t.integer "current"
    t.integer "min"
    t.boolean "started"
    t.boolean "destroy_on_finish"
    t.index ["group_id"], name: "index_threads_pad_jobs_on_group_id"
  end

  create_table "trolls", force: :cascade do |t|
    t.string   "login"
    t.integer  "site_id"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_trolls_on_login"
  end

end
