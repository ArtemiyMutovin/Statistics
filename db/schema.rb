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

ActiveRecord::Schema[7.0].define(version: 2023_02_02_113303) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_rates", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "rate_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_rates_on_game_id"
    t.index ["player_id"], name: "index_game_rates_on_player_id"
    t.index ["rate_id"], name: "index_game_rates_on_rate_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string "category", null: false
    t.integer "expected_value", default: 0, null: false
    t.string "condition", default: ">", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "player_id"
    t.integer "miles_run", default: 0, null: false
    t.integer "success_passes_percentage", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_statistics_on_game_id"
    t.index ["player_id"], name: "index_statistics_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_rates", "games"
  add_foreign_key "game_rates", "players"
  add_foreign_key "game_rates", "rates"
  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
  add_foreign_key "players", "teams"
  add_foreign_key "statistics", "games"
  add_foreign_key "statistics", "players"
end
