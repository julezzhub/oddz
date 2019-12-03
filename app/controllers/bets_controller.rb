class BetsController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    authorize @bet
  end

  def set_time(days, hours, minutes)
    days_in_sec = 86_400 * days
    hours_in_sec = 3600 * hours
    minutes_in_sec = 60 * minutes
    Time.now + days_in_sec + hours_in_sec + minutes_in_sec
  end

  private

  def bet_params
    params.require(:bet).permit(:target, :metric, :metric_count, :premade, :start_time, :end_time, :friend_id)
  end
end
