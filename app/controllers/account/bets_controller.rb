class Account::BetsController < ApplicationController

	def policy_scope(scope)
		super([:account, scope])
  end

  def index
    @all_bets = policy_scope(Bet).where(friend: current_user).or(Bet.where(user: current_user))
    @current_bets = @all_bets.select { |bet| bet.end_time > Time.now && !bet.status.nil? }
    @past_bets = @all_bets.select { |bet| bet.end_time < Time.now && !bet.status.nil? }
  end

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
    authorize @bet
  end

  def pending
    # receiving invitations
    @bets = policy_scope(Bet).where(friend: current_user, status: nil)
    # receiving invitations cards
    @bets.each do |bet|
      @time_until_end = seconds_to_hms(bet.end_time - Time.now)
      if bet.metric == 'Subscribers' || bet.metric == 'View Count'
        url = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{bet.target}&key=#{ENV['YOUTUBE_API_KEY1']}"
      else
        url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{bet.target}&key=#{ENV['YOUTUBE_API_KEY2']}"
      end
      result = open(url).read
      @data = JSON.parse(result)
      @statistics = @data['items'][0]['statistics']
      if bet.metric == "View Count"
        @real_count = @statistics["viewCount"].to_i
      else
        @real_count = @statistics["#{bet.metric.downcase.delete_suffix('s')}Count"].to_i
      end
      authorize bet
    end

    # sent invitations
    @sent_bets = policy_scope(Bet).where(user: current_user, status: nil) # .order(:start_time)
    # sent invitations cards
  end

  def seconds_to_hms(sec)
    "%02d hrs %02d mins" % [sec / 3600, sec / 60 % 60]
  end
end
