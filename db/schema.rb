# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_05_051633) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "agreements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "request_id"
    t.bigint "engineer_id"
    t.bigint "order_id"
    t.boolean "answer", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engineer_id"], name: "index_agreements_on_engineer_id"
    t.index ["order_id"], name: "index_agreements_on_order_id"
    t.index ["request_id"], name: "index_agreements_on_request_id"
  end

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "engineer_id"
    t.text "answer", null: false
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engineer_id"], name: "index_answers_on_engineer_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "engineer_id"
    t.string "payjp_customer_id"
    t.string "card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "completes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "request_id"
    t.boolean "conclusion", default: false, null: false
    t.bigint "engineer_id"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_completes_on_customer_id"
    t.index ["engineer_id"], name: "index_completes_on_engineer_id"
    t.index ["request_id"], name: "index_completes_on_request_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "post_code", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "house_number", null: false
    t.string "building_name"
    t.string "phone_number", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "engineers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "nickname", null: false
    t.integer "acceptable_area", default: 1, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "profile"
    t.integer "language_id", default: 1
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subscription_id"
    t.boolean "premium", default: false, null: false
    t.integer "study_id", default: 1
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_engineers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_engineers_on_reset_password_token", unique: true
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "request_id"
    t.bigint "engineer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engineer_id"], name: "index_orders_on_engineer_id"
    t.index ["request_id"], name: "index_orders_on_request_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "engineer_id"
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engineer_id"], name: "index_questions_on_engineer_id"
  end

  create_table "ratings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "rate", null: false
    t.bigint "customer_id"
    t.bigint "engineer_id"
    t.text "customer_comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_ratings_on_customer_id"
    t.index ["engineer_id"], name: "index_ratings_on_engineer_id"
  end

  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "title", null: false
    t.text "content", null: false
    t.integer "budget_id", null: false
    t.integer "term_id", null: false
    t.integer "approach_id", null: false
    t.text "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_requests_on_customer_id"
  end

  create_table "trainings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "detail", null: false
    t.integer "genre_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agreements", "engineers"
  add_foreign_key "agreements", "orders"
  add_foreign_key "agreements", "requests"
  add_foreign_key "answers", "engineers"
  add_foreign_key "answers", "questions"
  add_foreign_key "completes", "customers"
  add_foreign_key "completes", "engineers"
  add_foreign_key "completes", "requests"
  add_foreign_key "orders", "engineers"
  add_foreign_key "orders", "requests"
  add_foreign_key "questions", "engineers"
  add_foreign_key "ratings", "customers"
  add_foreign_key "ratings", "engineers"
  add_foreign_key "requests", "customers"
end
