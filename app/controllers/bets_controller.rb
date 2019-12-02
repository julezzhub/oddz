class BetsController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    raise
    @bet = Bet.new(bet_params)
    authorize @bet
  end

  def set_time(days, hours, minutes)
    days_in_sec = 86_400 * days
    hours_in_sec = 3600 * hours
    minutes_in_sec = 60 * minutes
    Time.now + days_in_sec + hours_in_sec + minutes_in_sec
  end

  def accept
    @bet = Bet.find(params[:id])
    @bet.update(status: true)
    authorize @bet

    redirect_to pending_account_bets_path
    flash[:notice] = "Bet accepted"
  end

  def reject
    @bet = Bet.find(params[:id])
    @bet.update(status: false)
    authorize @bet

    redirect_to pending_account_bets_path
    flash[:notice] = "Bet rejected"
  end

  private

  def bet_params
    params.require(:booking).permit(:target, :metric, :metric_count, :premade, :start_time, :end_time, :friend_id)
  end
end
