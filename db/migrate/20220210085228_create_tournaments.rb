# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments, primary_key: %w[cup_name season_number] do |t|
      t.string :cup_name, null: false # 大会名
      t.integer :season_number, default: 0, null: false # 大会番号
      t.integer :rank, null: false # 順位
      t.string :player_name, null: false # プレイヤー名
      t.integer :got_goals, null: false # 得点数
      t.integer :gave_goals, null: false # 失点数
      t.integer :points, null: false # 勝ち点
      t.timestamps
    end
  end
end
