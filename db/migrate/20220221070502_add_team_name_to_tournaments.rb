# frozen_string_literal: true

class AddTeamNameToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :team_name, :string, null: false
  end
end
