class BetsController < ApplicationController
  def new
    @bet = Bet.new
  end

  def create
  end

  def set_time(days, hours, minutes)
    days_in_sec = 86_400 * days
    hours_in_sec = 3600 * hours
    minutes_in_sec = 60 * minutes
    Time.now + days_in_sec + hours_in_sec + minutes_in_sec
  end
end
