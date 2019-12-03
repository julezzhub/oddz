class BetsController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.friend = User.find_by(username: params[:bet][:friend])
    @bet.start_time = Time.now
    @bet.end_time = @bet.start_time + params[:duration].to_i
    @bet.save!
    authorize @bet
  end

  private

  def bet_params
    params.require(:bet).permit(:target, :metric, :metric_count, :stake, :premade, :end_time)
  end
end
