# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_218_020_601) do
  create_table 'results', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.datetime 'match_date', null: false
    t.string 'player1_name', null: false
    t.string 'player2_name', null: false
    t.string 'player1_team', null: false
    t.string 'player2_team', null: false
    t.integer 'player1_fulltime_score', null: false
    t.integer 'player2_fulltime_score', null: false
    t.integer 'player1_halftime_score', null: false
    t.integer 'player2_halftime_score', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'player1_season_number', null: false
    t.integer 'player1_season_match_number', null: false
    t.integer 'player2_season_number', null: false
    t.integer 'player2_season_match_number', null: false
  end

  create_table 'tournaments', primary_key: %w[cup_name season_number rank], charset: 'utf8mb4',
                              collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'cup_name', null: false
    t.integer 'season_number', default: 0, null: false
    t.integer 'rank', null: false
    t.string 'player_name', null: false
    t.integer 'got_goals', null: false
    t.integer 'gave_goals', null: false
    t.integer 'points', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
