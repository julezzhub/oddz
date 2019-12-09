require 'json'
require 'open-uri'

class BetValidationJob < ApplicationJob
  queue_as :default

  def perform(target, metric, metric_count, id, user_id, friend_id)
    if metric == "Subscribers" || metric == "View Count"
      url = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{target}&key=#{ENV['YOUTUBE_API_KEY3']}"
    else
      url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{target}&key=#{ENV['YOUTUBE_API_KEY4']}"
    end
    result = open(url).read

    @data = JSON.parse(result)
    @statistics = @data["items"][0]["statistics"]
    if metric == "View Count"
      @real_count = @statistics["viewCount"].to_i
    else
      @real_count = @statistics["#{metric.downcase.delete_suffix('s')}Count"].to_i
    end
    @bet = Bet.find(id)
    @real_count >= metric_count ? @bet.update(winner_id: user_id) : @bet.update(winner_id: friend_id)
    # update balance
    @bet.winner.update(balance_cents: @bet.winner.balance_cents + @bet.stake_cents)

    loser_id = user_id == @bet.winner_id ? friend_id : user_id
    loser = User.find(loser_id)
    loser.update(balance_cents: loser.balance_cents - @bet.stake_cents)

    # skip_authorization
  end
end
