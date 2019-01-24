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

ActiveRecord::Schema.define(version: 2019_01_20_094824) do

  create_table "activity_details", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "work_detail_id", null: false
    t.integer "team_size"
    t.date "date"
    t.integer "amount_of_work"
    t.integer "expense"
    t.integer "revenue"
    t.integer "income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_activity", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "activity_details_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_line_items", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.decimal "quantity", precision: 10, scale: 2
    t.decimal "unit_rate", precision: 18, scale: 2
    t.decimal "tax", precision: 10
    t.decimal "amount", precision: 18, scale: 2
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "order_number"
    t.date "record_date"
    t.date "order_date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "unit_of_measure"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_details", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "unit_of_measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
