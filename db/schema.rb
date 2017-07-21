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

ActiveRecord::Schema.define(version: 20170723064517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.boolean  "favorite"
    t.integer  "user_id"
    t.string   "favorable_type"
    t.integer  "favorable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["favorable_type", "favorable_id"], name: "index_favorites_on_favorable_type_and_favorable_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "flower_photos", force: :cascade do |t|
    t.text     "assigned_name"
    t.text     "storage_url"
    t.integer  "plant_family_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "habitat_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["habitat_id"], name: "index_flower_photos_on_habitat_id", using: :btree
    t.index ["location_id"], name: "index_flower_photos_on_location_id", using: :btree
    t.index ["plant_family_id"], name: "index_flower_photos_on_plant_family_id", using: :btree
    t.index ["user_id"], name: "index_flower_photos_on_user_id", using: :btree
  end

  create_table "gvision_descriptions", force: :cascade do |t|
    t.text     "name"
    t.integer  "flower_photo_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["flower_photo_id"], name: "index_gvision_descriptions_on_flower_photo_id", using: :btree
  end

  create_table "habitats", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "address_number"
    t.text     "street_name"
    t.text     "city"
    t.text     "state"
    t.text     "country"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "plant_families", force: :cascade do |t|
    t.text     "common_name"
    t.text     "taxonomic_name"
    t.text     "growing_conditions"
    t.text     "sample_photo_storage_url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "plant_family_habitats", force: :cascade do |t|
    t.integer  "habitat_id"
    t.integer  "plant_family_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["habitat_id"], name: "index_plant_family_habitats_on_habitat_id", using: :btree
    t.index ["plant_family_id"], name: "index_plant_family_habitats_on_plant_family_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "flower_photos", "habitats"
  add_foreign_key "flower_photos", "locations"
  add_foreign_key "flower_photos", "plant_families"
  add_foreign_key "flower_photos", "users"
  add_foreign_key "gvision_descriptions", "flower_photos"
  add_foreign_key "plant_family_habitats", "habitats"
  add_foreign_key "plant_family_habitats", "plant_families"
end
