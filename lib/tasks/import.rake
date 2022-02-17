# frozen_string_literal: true

require 'csv'

namespace :import do
  task result_data: :environment do
    puts 'データを取り込む日付を指定してください(例:20220101)'
    target_date = $stdin.gets.chomp!
    path = File.join Rails.root, "db/csv/matches/#{target_date}.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        # statistcis centerのデータは日本時間と7時間差があるので合わせる
        match_date: Time.parse(row['match_date']) + 7 * 60 * 60,
        player1_name: row['player1_name'],
        player2_name: row['player2_name'],
        player1_team: row['player1_team'],
        player2_team: row['player2_team'],
        player1_fulltime_score: row['player1_fulltime_score'],
        player2_fulltime_score: row['player2_fulltime_score'],
        player1_halftime_score: row['player1_halftime_score'],
        player2_halftime_score: row['player2_halftime_score'],
        player1_season_number: 0, # この時点では不明なので0埋めしとく
        player1_season_match_number: 0, # この時点では不明なので0埋めしとく
        player2_season_number: 0, # この時点では不明なので0埋めしとく
        player2_season_match_number: 0 # この時点では不明なので0埋めしとく
      }
    end
    begin
      Result.create!(list)
    rescue ActiveModel::UnknownAttributeError => e
      puts 'raised error : unKnown attribute '
      puts e
    end
  end
end
