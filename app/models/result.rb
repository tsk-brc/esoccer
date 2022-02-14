# frozen_string_literal: true

# == Schema Information
#
# Table name: results
#
#  id                          :integer          not null, primary key
#  match_date                  :datetime         not null
#  player1_name                :string(255)      not null
#  player2_name                :string(255)      not null
#  player1_team                :string(255)      not null
#  player2_team                :string(255)      not null
#  player1_fulltime_score      :integer          not null
#  player2_fulltime_score      :integer          not null
#  player1_halftime_score      :integer          not null
#  player2_halftime_score      :integer          not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  player1_season_number       :integer          not null
#  player1_season_match_number :integer          not null
#  player2_season_number       :integer          not null
#  player2_season_match_number :integer          not null
#

class Result < ApplicationRecord
  scope :player1_won_count, lambda { |player_name|
    where('player1_name = ? AND player1_fulltime_score > player2_fulltime_score', player_name)
  }
  scope :player2_won_count, lambda { |player_name|
    where('player2_name = ? AND player2_fulltime_score > player1_fulltime_score', player_name)
  }
  scope :player1_lost_count, lambda { |player_name|
    where('player1_name = ? AND player1_fulltime_score < player2_fulltime_score', player_name)
  }
  scope :player2_lost_count, lambda { |player_name|
    where('player2_name = ? AND player2_fulltime_score < player1_fulltime_score', player_name)
  }
  scope :player1_drew_count, lambda { |player_name|
    where('player1_name = ? AND player1_fulltime_score = player2_fulltime_score', player_name)
  }
  scope :player2_drew_count, lambda { |player_name|
    where('player2_name = ? AND player2_fulltime_score = player1_fulltime_score', player_name)
  }
  scope :season_player1_won_count, lambda { |player_name, season_number, season_match_number|
    where('player1_name = ? AND player1_season_number = ? AND player1_season_match_number = ? AND
        player1_fulltime_score > player2_fulltime_score', player_name, season_number, season_match_number)
  }
  scope :season_player2_won_count, lambda { |player_name, season_number, season_match_number|
    where('player2_name = ? AND player2_season_number = ? AND player2_season_match_number = ? AND
        player1_fulltime_score < player2_fulltime_score', player_name, season_number, season_match_number)
  }
  scope :season_player1_lost_count, lambda { |player_name, season_number, season_match_number|
    where('player1_name = ? AND player1_season_number = ? AND player1_season_match_number = ? AND
        player1_fulltime_score < player2_fulltime_score', player_name, season_number, season_match_number)
  }
  scope :season_player2_lost_count, lambda { |player_name, season_number, season_match_number|
    where('player2_name = ? AND player2_season_number = ? AND player2_season_match_number = ? AND
        player1_fulltime_score > player2_fulltime_score', player_name, season_number, season_match_number)
  }
  scope :season_player1_drew_count, lambda { |player_name, season_number, season_match_number|
    where('player1_name = ? AND player1_season_number = ? AND player1_season_match_number = ? AND
        player1_fulltime_score = player2_fulltime_score', player_name, season_number, season_match_number)
  }
  scope :season_player2_drew_count, lambda { |player_name, season_number, season_match_number|
    where('player2_name = ? AND player2_season_number = ? AND player2_season_match_number = ? AND
        player1_fulltime_score = player2_fulltime_score', player_name, season_number, season_match_number)
  }
  scope :player1_got_goals_matches_count, lambda { |player_name, season_number, season_match_number|
    where('player1_name = ? AND player1_season_number = ? AND player1_season_match_number = ? AND
        player1_fulltime_score > 0', player_name, season_number, season_match_number)
  }
  scope :player2_got_goals_matches_count, lambda { |player_name, season_number, season_match_number|
    where('player2_name = ? AND player2_season_number = ? AND player2_season_match_number = ? AND
        player2_fulltime_score > 0', player_name, season_number, season_match_number)
  }
  scope :player1_gave_goals_matches_count, lambda { |player_name, season_number, season_match_number|
    where('player1_name = ? AND player1_season_number = ? AND player1_season_match_number = ? AND
        player2_fulltime_score > 0', player_name, season_number, season_match_number)
  }
  scope :player2_gave_goals_matches_count, lambda { |player_name, season_number, season_match_number|
    where('player2_name = ? AND player2_season_number = ? AND player2_season_match_number = ? AND
        player1_fulltime_score > 0', player_name, season_number, season_match_number)
  }
end
