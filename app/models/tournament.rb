# == Schema Information
#
# Table name: tournaments
#
#  cup_name      :string(255)      not null
#  season_number :integer          default("0"), not null
#  rank          :integer          not null
#  player_name   :string(255)      not null
#  got_goals     :integer          not null
#  gave_goals    :integer          not null
#  points        :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# frozen_string_literal: true

class Tournament < ApplicationRecord
end
