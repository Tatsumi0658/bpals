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

ActiveRecord::Schema.define(version: 2019_06_23_135039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashtag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multipleposts", force: :cascade do |t|
    t.json "images", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "post_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["profile_id"], name: "index_post_comments_on_profile_id"
  end

  create_table "post_hashtag_relationships", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id"], name: "index_post_hashtag_relationships_on_hashtag_id"
    t.index ["post_id"], name: "index_post_hashtag_relationships_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "product_comments", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "product_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_comments_on_product_id"
    t.index ["profile_id"], name: "index_product_comments_on_profile_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.json "product_images"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "image"
    t.integer "age"
    t.integer "skintype"
    t.integer "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "profiles"
  add_foreign_key "post_hashtag_relationships", "hashtags"
  add_foreign_key "post_hashtag_relationships", "posts"
  add_foreign_key "posts", "profiles"
  add_foreign_key "product_comments", "products"
  add_foreign_key "product_comments", "profiles"
  add_foreign_key "profiles", "users"
end
