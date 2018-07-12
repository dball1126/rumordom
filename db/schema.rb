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

ActiveRecord::Schema.define(version: 20180503041544) do

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone"
    t.string "email"
    t.string "category1"
    t.string "category2"
    t.string "category3"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.integer "category1_id"
    t.integer "category2_id"
    t.integer "category3_id"
    t.string "image"
    t.index ["category1_id"], name: "index_businesses_on_category1_id"
    t.index ["category2_id"], name: "index_businesses_on_category2_id"
    t.index ["category3_id"], name: "index_businesses_on_category3_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.integer "business_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "picture"
    t.index ["business_id"], name: "index_experiences_on_business_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "relationshipzs", force: :cascade do |t|
    t.integer "followerz_id"
    t.integer "followedz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followedz_id"], name: "index_relationshipzs_on_followedz_id"
    t.index ["followerz_id", "followedz_id"], name: "index_relationshipzs_on_followerz_id_and_followedz_id", unique: true
    t.index ["followerz_id"], name: "index_relationshipzs_on_followerz_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["business_id", "created_at"], name: "index_reviews_on_business_id_and_created_at"
    t.index ["business_id"], name: "index_reviews_on_business_id"
    t.index ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
