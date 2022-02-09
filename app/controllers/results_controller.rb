# frozen_string_literal: true

class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def search
    @q = Result.ransack(params[:q])
    @results = @q.result(distinct: true).order(match_date: :desc).page(params[:page]).per(20)
    render :index
  end
end
