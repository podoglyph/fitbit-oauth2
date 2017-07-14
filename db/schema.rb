ActiveRecord::Schema.define(version: 20170714183523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "uid"
    t.string "age"
    t.string "first_name"
    t.string "display_name"
    t.string "birthdate"
  end

end
