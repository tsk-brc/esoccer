# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.datetime :match_date, null: false # 試合日時
      t.string :player1_name, null: false # Player1
      t.string :player2_name, null: false # Player2
      t.string :player1_team, null: false # Player1の使用チーム
      t.string :player2_team, null: false # Player2の使用チーム
      t.integer :player1_fulltime_score, null: false # Player1の最終スコア
      t.integer :player2_fulltime_score, null: false # Player2の最終スコア
      t.integer :player1_halftime_score, null: false # Player1の前半スコア
      t.integer :player2_halftime_score, null: false # Player2の前半スコア
      t.timestamps
    end
  end
end
