# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_23_084345) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "clients", charset: "utf8mb4", force: :cascade do |t|
    t.string "type"
    t.string "firstname"
    t.string "lastname"
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "content"
    t.bigint "author_id"
    t.string "target_type"
    t.bigint "target_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["target_type", "target_id"], name: "index_comments_on_target"
  end

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.integer "quantity"
    t.decimal "item_price", precision: 10, scale: 2
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.text "description"
    t.bigint "category_id"
    t.bigint "supplier_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "comments", "clients", column: "author_id"
  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "clients"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "suppliers"
end
