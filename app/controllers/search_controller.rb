require 'json'
require 'open-uri'

class SearchController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    if params[:type] == 'video'
      url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{params[:target]}&type=video&key=#{ENV['YOUTUBE_API_KEY']}"
    else
      url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{params[:target]}&type=channel&key=#{ENV['YOUTUBE_API_KEY']}"
    end
    result = open(url).read
    @data = JSON.parse(result)
    respond_to do |format|
      format.html { render :new }
      format.js
    end
    skip_authorization
  end
end

# p get_videos("Travis Scott")['items'].map { |item| item['snippet']['title'] }
# p get_videos("Travis Scott")['items'].map { |item| item['snippet']['publishedAt'] }
# p get_videos("Travis Scott")['items'].map { |item| item['snippet']['channelTitle'] }
# p get_videos("Travis Scott")['items'].map { |item| item['snippet']['thumbnails']['high']['url'] }
