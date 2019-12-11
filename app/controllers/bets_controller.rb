require 'json'
require 'open-uri'

class BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
    @time_until_end = seconds_to_hms(@bet.end_time - Time.now)
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
    skip_authorization
  end

  def new
    if params[:target][:kind] == "youtube#channel"
     url = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{params[:target][:channelId]}&key=#{ENV['YOUTUBE_API_KEY1']}"
    else
     url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{params[:target][:videoId]}&key=#{ENV['YOUTUBE_API_KEY2']}"
    end
    result = open(url).read
    data = JSON.parse(result)
    @statistics = data["items"][0]["statistics"]
    @bet = Bet.new
    authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.target = params[:target]
    @bet.metric = params[:metric]
    @bet.metric_count = params[:hidden_metric_count]
    @bet.video_title = params[:title]
    @bet.thumbnail = params[:thumbnail]
    @bet.friend = User.find_by(username: params[:bet][:friend])
    @bet.start_time = Time.now
    @bet.end_time = @bet.start_time + params[:duration].to_i
    @bet.bet_expiration = params[:duration].to_i
    @bet.save!
    authorize @bet
    notification = Notification.new(user: @bet.friend, notifiable: current_user, category: "New Bet Invitation")
    notification.save
    current_user.balance -= @bet.stake
    current_user.save
  end

  def accept
    @bet = Bet.find(params[:id])
    @bet.update(status: true)
    authorize @bet
    # BetValidationJob.perform_now(@bet.target, @bet.metric, @bet.metric_count, @bet.id, @bet.user_id, @bet.friend_id)
    BetValidationJob.set(wait_until: @bet.end_time).perform_later(@bet.target, @bet.metric, @bet.metric_count, @bet.id, @bet.user_id, @bet.friend_id)
    notification = Notification.new(user: @bet.user, notifiable: current_user, category: "Accepted Bet Invitation")
    notification.save
    @bet.friend.balance -= @bet.stake
    @bet.friend.save
    redirect_to pending_account_bets_path
    flash[:notice] = "Bet accepted"
  end

  def reject
    @bet = Bet.find(params[:id])
    @bet.update(status: false)
    authorize @bet
    notification = Notification.new(user: @bet.user, notifiable: current_user, category: "Rejected Bet Invitation")
    notification.save
    @bet.user.balance += @bet.stake
    @bet.user.save
    redirect_to pending_account_bets_path
    flash[:notice] = "Bet rejected"
  end

  def new_premade
    @bet = Bet.new
    authorize @bet
    @premade_bet = Bet.find(params[:bet])
  end

  def seconds_to_hms(sec)
    "%02d hours %02d minutes" % [sec / 3600, sec / 60 % 60]
  end

  private

  def bet_params
    if params[:premade]
      params.require(:bet).permit(:target, :metric_count, :stake, :premade, :end_time)
    else
      params.require(:bet).permit(:target, :stake, :premade, :end_time)
    end
  end
end
