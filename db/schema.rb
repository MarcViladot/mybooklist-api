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

ActiveRecord::Schema.define(version: 20180815184654) do

  create_table "addeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.integer "score"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_addeds_on_book_id"
    t.index ["user_id"], name: "index_addeds_on_user_id"
  end

  create_table "authorbooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.bigint "book_id"
    t.index ["author_id"], name: "index_authorbooks_on_author_id"
    t.index ["book_id"], name: "index_authorbooks_on_book_id"
  end

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.date "born"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.text "biography"
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "plot"
    t.integer "year"
    t.string "lang"
    t.integer "pages"
    t.string "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "serie_id"
    t.string "cover"
    t.index ["serie_id"], name: "index_books_on_serie_id"
  end

  create_table "favauthors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_favauthors_on_author_id"
    t.index ["user_id"], name: "index_favauthors_on_user_id"
  end

  create_table "favbooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_favbooks_on_book_id"
    t.index ["user_id"], name: "index_favbooks_on_user_id"
  end

  create_table "genrebooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.bigint "genre_id"
    t.index ["book_id"], name: "index_genrebooks_on_book_id"
    t.index ["genre_id"], name: "index_genrebooks_on_genre_id"
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "text"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "series", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "avatar", default: "https://picsum.photos/200/200/?random"
    t.binary "role"
    t.binary "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
  end

  add_foreign_key "books", "series", column: "serie_id"
  add_foreign_key "favauthors", "authors"
  add_foreign_key "favauthors", "users"
  add_foreign_key "favbooks", "books"
  add_foreign_key "favbooks", "users"
  add_foreign_key "genrebooks", "books"
  add_foreign_key "genrebooks", "genres"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
