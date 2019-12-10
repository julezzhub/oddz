require 'json'
require 'open-uri'

class BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
    if @bet.metric == 'Subscribers' || @bet.metric == 'View Count'
      url = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{@bet.target}&key=#{ENV['YOUTUBE_API_KEY1']}"
    else
      url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{@bet.target}&key=#{ENV['YOUTUBE_API_KEY2']}"
    end
    result = open(url).read
    @data = JSON.parse(result)
    @statistics = @data['items'][0]['statistics']
    if @bet.metric == "View Count"
      @real_count = @statistics["viewCount"].to_i
    else
      @real_count = @statistics["#{@bet.metric.downcase.delete_suffix('s')}Count"].to_i
    end
    authorize @bet
  end

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
    @bet.bet_expiration = params[:duration].to_i
    @bet.save!
    authorize @bet
    notification = Notification.new(user: @bet.friend, notifiable: current_user, category: "New Bet Invitation")
    notification.save
  end

  def accept
    @bet = Bet.find(params[:id])
    @bet.update(status: true)
    authorize @bet
    # BetValidationJob.perform_now(@bet.target, @bet.metric, @bet.metric_count, @bet.id, @bet.user_id, @bet.friend_id)
    BetValidationJob.set(wait_until: @bet.end_time).perform_later(@bet.target, @bet.metric, @bet.metric_count, @bet.id, @bet.user_id, @bet.friend_id)
    notification = Notification.new(user: @bet.user, notifiable: current_user, category: "Accepted Bet Invitation")
    notification.save
    redirect_to pending_account_bets_path
    flash[:notice] = "Bet accepted"
  end

  def reject
    @bet = Bet.find(params[:id])
    @bet.update(status: false)
    authorize @bet
    notification = Notification.new(user: @bet.user, notifiable: current_user, category: "Rejected Bet Invitation")
    notification.save
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
