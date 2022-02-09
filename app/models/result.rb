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
end
