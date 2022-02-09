# frozen_string_literal: true

class RenameSeasonNumberToResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :results, :season_number, :player1_season_number
    rename_column :results, :season_match_number, :player1_season_match_number
  end
end
