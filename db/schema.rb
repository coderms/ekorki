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

ActiveRecord::Schema.define(version: 20190303064128) do

  create_table "ogloszenia", force: :cascade do |t|
    t.string  "tytul"
    t.text    "opis"
    t.string  "telefon"
    t.string  "imie"
    t.string  "nazwisko"
    t.string  "email"
    t.binary  "photo"
    t.string  "kategoria"
    t.integer "uzytkownik_id"
  end

  create_table "plan_zajecs", force: :cascade do |t|
    t.datetime "data_od"
    t.datetime "data_do"
    t.string   "zoom_room"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uzytkowniks", force: :cascade do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "haslo"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary   "photo"
  end

  create_table "zajecies", force: :cascade do |t|
    t.string   "temat"
    t.string   "opis"
    t.integer  "ilosc_uczniow"
    t.string   "program"
    t.integer  "plan_zajecs_id"
    t.integer  "nauczyciel_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "zajecies", ["plan_zajecs_id"], name: "index_zajecies_on_plan_zajecs_id"

end
