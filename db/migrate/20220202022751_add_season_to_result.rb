# frozen_string_literal: true

class AddSeasonToResult < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :season_number, :integer, null: false
    add_column :results, :season_match_number, :integer, null: false
  end
end
