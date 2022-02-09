# frozen_string_literal: true

class AddPlayer2SeasonNumberToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :player2_season_number, :integer, null: false
    add_column :results, :player2_season_match_number, :integer, null: false
  end
end
