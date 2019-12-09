class BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
    authorize @bet
  end

  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    raise
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.target = params[:target]
    @bet.friend = User.find_by(username: params[:bet][:friend])
    @bet.start_time = Time.now
    @bet.end_time = @bet.start_time + params[:duration].to_i
    @bet.bet_expiration = params[:duration].to_i
    @bet.save!
    authorize @bet
  end

  def accept
    @bet = Bet.find(params[:id])
    @bet.update(status: true)
    authorize @bet
    BetValidationJob.set(wait_until: @bet.end_time).perform_later(@bet.target, @bet.metric, @bet.metric_count, @bet.id, @bet.user_id, @bet.friend_id)

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
