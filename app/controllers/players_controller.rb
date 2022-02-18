# frozen_string_literal: true

class PlayersController < ApplicationController
  def index; end

  def show
    match_result
    season1_result
    season2_result
    season3_result
  end

  private

  def match_result
    player1_won_count = Result.player1_won_count(params[:player1_name]).count
    player2_won_count = Result.player2_won_count(params[:player1_name]).count
    player1_lost_count = Result.player1_lost_count(params[:player1_name]).count
    player2_lost_count = Result.player2_lost_count(params[:player1_name]).count
    player1_drew_count = Result.player1_drew_count(params[:player1_name]).count
    player2_drew_count = Result.player2_drew_count(params[:player1_name]).count
    @total_won_count = player1_won_count + player2_won_count
    @total_lost_count = player1_lost_count + player2_lost_count
    @total_drew_count = player1_drew_count + player2_drew_count
    total_match = @total_won_count + @total_lost_count + @total_drew_count
    @win_rate = ((@total_won_count.to_f / total_match) * 100.0).round(2)
    @double_chance_rate = (((@total_won_count + @total_drew_count).to_f / total_match) * 100.0).round(2)
    @got_goals_per_match = ((Result.where(player1_name: params[:player1_name]).sum(:player1_fulltime_score) +
      Result.where(player2_name: params[:player1_name]).sum(:player2_fulltime_score)).to_f / total_match).round(2)
    @gave_goals_per_match = ((Result.where(player1_name: params[:player1_name]).sum(:player2_fulltime_score) +
      Result.where(player2_name: params[:player1_name]).sum(:player1_fulltime_score)).to_f / total_match).round(2)
  end

  def season1_result
    @season1_won_count = []
    @season1_lost_count = []
    @season1_drew_count = []
    @season1_won_rate = []
    @season1_double_chance_rate = []
    @season1_got_goals_per_match = []
    @season1_gave_goals_per_match = []
    @season1_got_goals_percentage = []
    @season1_gave_goals_percentage = []
    (1..8).each do |num|
      season1_player1_won_count = Result.season_player1_won_count(params[:player1_name], 1, num).count
      season1_player2_won_count = Result.season_player2_won_count(params[:player1_name], 1, num).count
      season1_player1_lost_count = Result.season_player1_lost_count(params[:player1_name], 1, num).count
      season1_player2_lost_count = Result.season_player2_lost_count(params[:player1_name], 1, num).count
      season1_player1_drew_count = Result.season_player1_drew_count(params[:player1_name], 1, num).count
      season1_player2_drew_count = Result.season_player2_drew_count(params[:player1_name], 1, num).count
      @season1_won_count << season1_player1_won_count + season1_player2_won_count
      @season1_lost_count << season1_player1_lost_count + season1_player2_lost_count
      @season1_drew_count << season1_player1_drew_count + season1_player2_drew_count
      season1_total_match = @season1_won_count[num - 1] + @season1_lost_count[num - 1] + @season1_drew_count[num - 1]
      if season1_total_match != 0
        @season1_won_rate << ((@season1_won_count[num - 1].to_f / season1_total_match) * 100.0).round(2)
        @season1_double_chance_rate << (((@season1_won_count[num - 1] +
          @season1_drew_count[num - 1]).to_f / season1_total_match) * 100.0).round(2)
        @season1_got_goals_per_match << ((Result.player1_got_goals_matches_count(params[:player1_name], 1,
                                                                                 num).sum(:player1_fulltime_score) +
          Result.player2_got_goals_matches_count(params[:player1_name], 1,
                                                 num).sum(:player2_fulltime_score)).to_f / season1_total_match).round(2)
        @season1_gave_goals_per_match << ((Result.player1_gave_goals_matches_count(params[:player1_name], 1,
                                                                                   num).sum(:player2_fulltime_score) +
          Result.player2_gave_goals_matches_count(params[:player1_name], 1, num)
          .sum(:player1_fulltime_score)).to_f / season1_total_match).round(2)
        @season1_got_goals_percentage << ((Result.player1_got_goals_matches_count(params[:player1_name], 1, num).count +
          Result.player2_got_goals_matches_count(params[:player1_name], 1,
                                                 num).count).to_f / season1_total_match * 100.0).round(2)
        @season1_gave_goals_percentage << ((Result.player1_gave_goals_matches_count(params[:player1_name], 1,
                                                                                    num).count +
          Result.player2_gave_goals_matches_count(params[:player1_name], 1,
                                                  num).count).to_f / season1_total_match * 100.0).round(2)
      else
        @season1_won_rate << 0
        @season1_double_chance_rate << 0
        @season1_got_goals_per_match << 0
        @season1_gave_goals_per_match << 0
        @season1_got_goals_percentage << 0
        @season1_gave_goals_percentage << 0
      end
    end
  end

  def season2_result
    @season2_won_count = []
    @season2_lost_count = []
    @season2_drew_count = []
    @season2_won_rate = []
    @season2_double_chance_rate = []
    @season2_got_goals_per_match = []
    @season2_gave_goals_per_match = []
    @season2_got_goals_percentage = []
    @season2_gave_goals_percentage = []
    (1..8).each do |num|
      season2_player1_won_count = Result.season_player1_won_count(params[:player1_name], 2, num).count
      season2_player2_won_count = Result.season_player2_won_count(params[:player1_name], 2, num).count
      season2_player1_lost_count = Result.season_player1_lost_count(params[:player1_name], 2, num).count
      season2_player2_lost_count = Result.season_player2_lost_count(params[:player1_name], 2, num).count
      season2_player1_drew_count = Result.season_player1_drew_count(params[:player1_name], 2, num).count
      season2_player2_drew_count = Result.season_player2_drew_count(params[:player1_name], 2, num).count
      @season2_won_count << season2_player1_won_count + season2_player2_won_count
      @season2_lost_count << season2_player1_lost_count + season2_player2_lost_count
      @season2_drew_count << season2_player1_drew_count + season2_player2_drew_count
      season2_total_match = @season2_won_count[num - 1] + @season2_lost_count[num - 1] + @season2_drew_count[num - 1]
      if season2_total_match != 0
        @season2_won_rate << ((@season2_won_count[num - 1].to_f / season2_total_match) * 100.0).round(2)
        @season2_double_chance_rate << (((@season2_won_count[num - 1] +
          @season2_drew_count[num - 1]).to_f / season2_total_match) * 100.0).round(2)
        @season2_got_goals_per_match << ((Result.player1_got_goals_matches_count(params[:player1_name], 2,
                                                                                 num).sum(:player1_fulltime_score) +
          Result.player2_got_goals_matches_count(params[:player1_name], 2, num)
          .sum(:player2_fulltime_score)).to_f / season2_total_match).round(2)
        @season2_gave_goals_per_match << ((Result.player1_gave_goals_matches_count(params[:player1_name], 2,
                                                                                   num).sum(:player2_fulltime_score) +
          Result.player2_gave_goals_matches_count(params[:player1_name],
                                                  2, num).sum(:player1_fulltime_score)).to_f / season2_total_match).round(2)
        @season2_got_goals_percentage << ((Result.player1_got_goals_matches_count(params[:player1_name], 2, num).count +
          Result.player2_got_goals_matches_count(params[:player1_name], 2,
                                                 num).count).to_f / season2_total_match * 100.0).round(2)
        @season2_gave_goals_percentage << ((Result.player1_gave_goals_matches_count(params[:player1_name], 2,
                                                                                    num).count +
          Result.player2_gave_goals_matches_count(params[:player1_name], 2,
                                                  num).count).to_f / season2_total_match * 100.0).round(2)
      else
        @season2_won_rate << 0
        @season2_double_chance_rate << 0
        @season2_got_goals_per_match << 0
        @season2_gave_goals_per_match << 0
        @season2_got_goals_percentage << 0
        @season2_gave_goals_percentage << 0
      end
    end
  end

  def season3_result
    @season3_won_count = []
    @season3_lost_count = []
    @season3_drew_count = []
    @season3_won_rate = []
    @season3_double_chance_rate = []
    @season3_got_goals_per_match = []
    @season3_gave_goals_per_match = []
    @season3_got_goals_percentage = []
    @season3_gave_goals_percentage = []
    (1..8).each do |num|
      season3_player1_won_count = Result.season_player1_won_count(params[:player1_name], 3, num).count
      season3_player2_won_count = Result.season_player2_won_count(params[:player1_name], 3, num).count
      season3_player1_lost_count = Result.season_player1_lost_count(params[:player1_name], 3, num).count
      season3_player2_lost_count = Result.season_player2_lost_count(params[:player1_name], 3, num).count
      season3_player1_drew_count = Result.season_player1_drew_count(params[:player1_name], 3, num).count
      season3_player2_drew_count = Result.season_player2_drew_count(params[:player1_name], 3, num).count
      @season3_won_count << season3_player1_won_count + season3_player2_won_count
      @season3_lost_count << season3_player1_lost_count + season3_player2_lost_count
      @season3_drew_count << season3_player1_drew_count + season3_player2_drew_count
      season3_total_match = @season3_won_count[num - 1] + @season3_lost_count[num - 1] + @season3_drew_count[num - 1]
      if season3_total_match != 0
        @season3_won_rate << ((@season3_won_count[num - 1].to_f / season3_total_match) * 100.0).round(2)
        @season3_double_chance_rate << (((@season3_won_count[num - 1] +
          @season3_drew_count[num - 1]).to_f / season3_total_match) * 100.0).round(2)
        @season3_got_goals_per_match << ((Result.player1_got_goals_matches_count(params[:player1_name], 3,
                                                                                 num).sum(:player1_fulltime_score) +
          Result.player2_got_goals_matches_count(params[:player1_name], 3,
                                                 num).sum(:player2_fulltime_score)).to_f / season3_total_match).round(2)
        @season3_gave_goals_per_match << ((Result.player1_gave_goals_matches_count(params[:player1_name], 3,
                                                                                   num).sum(:player2_fulltime_score) +
          Result.player2_gave_goals_matches_count(params[:player1_name], 3,
                                                  num).sum(:player1_fulltime_score)).to_f / season3_total_match).round(2)
        @season3_got_goals_percentage << ((Result.player1_got_goals_matches_count(params[:player1_name], 3,
                                                                                  num).count + Result.player2_got_goals_matches_count(params[:player1_name], 3,
                                                                                                                                      num).count).to_f / season3_total_match * 100.0).round(2)
        @season3_gave_goals_percentage << ((Result.player1_gave_goals_matches_count(params[:player1_name], 3,
                                                                                    num).count + Result.player2_gave_goals_matches_count(params[:player1_name], 3,
                                                                                                                                         num).count).to_f / season3_total_match * 100.0).round(2)
      else
        @season3_won_rate << 0
        @season3_double_chance_rate << 0
        @season3_got_goals_per_match << 0
        @season3_gave_goals_per_match << 0
        @season3_got_goals_percentage << 0
        @season3_gave_goals_percentage << 0
      end
    end
  end
end
