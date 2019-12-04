class BetsController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.target = params[:target]
    @bet.friend = User.find_by(username: params[:bet][:friend])
    @bet.start_time = Time.now
    @bet.end_time = @bet.start_time + params[:duration].to_i
    @bet.save!
    authorize @bet
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

  def new_premade
    @bet = Bet.new
    authorize @bet
    @premade_bet = Bet.find(params[:bet])
  end

  private

  def bet_params
    params.require(:bet).permit(:target, :metric, :metric_count, :stake, :premade, :end_time)
  end
end
