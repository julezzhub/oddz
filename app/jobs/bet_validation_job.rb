require 'json'
require 'open-uri'

class BetValidationJob < ApplicationJob
  queue_as :default

  def perform(target, metric, metric_count, id, user_id, friend_id)
    if metric == "Subscribers" || metric == "View Count"
      url = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{target}&key=#{ENV['YOUTUBE_API_KEY1']}"
    else
      url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{target}&key=#{ENV['YOUTUBE_API_KEY2']}"
    end
    result = open(url).read

    @data = JSON.parse(result)
    @statistics = @data["items"][0]["statistics"]
    if metric == "Total Views"
      @real_count = @statistics["viewCount"].to_i
    else
      @real_count = @statistics["#{metric.downcase.delete_suffix('s')}Count"].to_i
    end
    @bet = Bet.find(id)
    @real_count >= metric_count ? @bet.update(winner_id: user_id) : @bet.update(winner_id: friend_id)
    # skip_authorization
  end
end
