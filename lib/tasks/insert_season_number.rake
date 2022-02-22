# frozen_string_literal: true

namespace :insert do
  task season_number: :environment do
    players = Tournament.distinct.pluck(:player_name)
    players.each do |player|
      player_name = File.basename(player, '.*')
      player_results = Result.where('(player1_season_number = 0 and player1_name = ?) or
        (player2_season_number = 0 and player2_name = ?)', player_name, player_name)
      match_count = Result.where('(player1_season_number = 0 and player1_name = ?) or
        (player2_season_number = 0 and player2_name = ?)', player_name, player_name).count
      # 試合数は必ず24の倍数でなければならない(1クール8試合 × 3クール)
      if match_count % 24 != 0
        puts "#{player_name}のレコード数が24の倍数ではないため処理が行えません。レコード数を確認してから再度実行してください"
        next
      end
      ActiveRecord::Base.transaction do
        season_number = 1
        season_match_number = 1
        match_count.times do |num|
          player_result = player_results[num]
          if player_result.player1_name == player_name
            player_result.update(player1_season_number: season_number, player1_season_match_number: season_match_number)
          else
            player_result.update(player2_season_number: season_number, player2_season_match_number: season_match_number)
          end
          if season_number == 3
            season_number = 1
          else
            season_number += 1
          end
          if season_match_number == 8
            season_match_number = 1
          else
            season_match_number += 1
          end
        end
      end
    end
  end
end
