require 'json'
require 'open-uri'

class SearchController < ApplicationController
  def new
    @bet = Bet.new
    authorize @bet
  end

  def create
    if params[:type] == 'video'
      url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{params[:target]}&type=video&key=#{ENV['YOUTUBE_API_KEY1']}&maxResults=15"
    else
      url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{params[:target]}&type=channel&key=#{ENV['YOUTUBE_API_KEY2']}&maxResults=15"
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
