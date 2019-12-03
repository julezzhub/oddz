require 'json'
require 'open-uri'

class SearchController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{params[:target]}&type=video&key=AIzaSyDB35LsQ5MAlBIATAgo7BvvDJR5RWeYS3M"
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
