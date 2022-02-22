# frozen_string_literal: true

class AddResultToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :wins, :integer, null: false
    add_column :tournaments, :draws, :integer, null: false
    add_column :tournaments, :losses, :integer, null: false
  end
end
