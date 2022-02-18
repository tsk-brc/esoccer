# frozen_string_literal: true

require 'csv'

namespace :import do
  task tournaments_data: :environment do
    puts 'データを取り込む日付を指定してください(例:20220101)'
    target_date = $stdin.gets.chomp!
    path = File.join Rails.root, "db/csv/tournaments/#{target_date}.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        cup_name: row['cup_name'],
        season_number: row['season_number'],
        rank: row['rank'],
        player_name: row['player_name'],
        got_goals: row['got_goals'],
        gave_goals: row['gave_goals'],
        points: row['points']
      }
    end
    begin
      Tournament.create!(list)
    rescue ActiveModel::UnknownAttributeError => e
      puts 'raised error : unKnown attribute '
      puts e
    end
  end
end
