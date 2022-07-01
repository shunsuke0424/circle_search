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

ActiveRecord::Schema.define(version: 2022_05_26_105943) do

  create_table 'arts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'athletics', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'companies', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'number'
    t.text 'detail', null: false
    t.string 'place'
    t.text 'images_path'
    t.integer 'frequency'
    t.string 'activity_day'
    t.string 'sns_link'
    t.string 'company_category'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'company_arts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'company_id', null: false
    t.bigint 'art_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['art_id'], name: 'index_company_arts_on_art_id'
    t.index ['company_id', 'art_id'], name: 'index_company_arts_on_company_id_and_art_id', unique: true
    t.index ['company_id'], name: 'index_company_arts_on_company_id'
  end

  create_table 'company_athletics', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'company_id', null: false
    t.bigint 'athletic_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['athletic_id'], name: 'index_company_athletics_on_athletic_id'
    t.index ['company_id', 'athletic_id'], name: 'index_company_athletics_on_company_id_and_athletic_id', unique: true
    t.index ['company_id'], name: 'index_company_athletics_on_company_id'
  end

  create_table 'company_cultures', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'company_id', null: false
    t.bigint 'culture_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id', 'culture_id'], name: 'index_company_cultures_on_company_id_and_culture_id', unique: true
    t.index ['company_id'], name: 'index_company_cultures_on_company_id'
    t.index ['culture_id'], name: 'index_company_cultures_on_culture_id'
  end

  create_table 'company_keywords', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'company_id', null: false
    t.bigint 'keyword_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id', 'keyword_id'], name: 'index_company_keywords_on_company_id_and_keyword_id', unique: true
    t.index ['company_id'], name: 'index_company_keywords_on_company_id'
    t.index ['keyword_id'], name: 'index_company_keywords_on_keyword_id'
  end

  create_table 'cultures', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'keywords', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'content', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['content'], name: 'index_keywords_on_content', unique: true
  end

  add_foreign_key 'company_arts', 'arts'
  add_foreign_key 'company_arts', 'companies'
  add_foreign_key 'company_athletics', 'athletics'
  add_foreign_key 'company_athletics', 'companies'
  add_foreign_key 'company_cultures', 'companies'
  add_foreign_key 'company_cultures', 'cultures'
  add_foreign_key 'company_keywords', 'companies'
end
