require 'json'
require 'open-uri'

def get_info(query)
  url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{query}&type=video&key=AIzaSyDB9ypRe8INNPx40PzM_iDU5rwbym0Ungk"
  result = open(url).read
  JSON.parse(result)
end

# p get_info("Travis Scott")['items'].map { |item| item['snippet']['title'] }
# p get_info("Travis Scott")['items'].map { |item| item['snippet']['publishedAt'] }
# p get_info("Travis Scott")['items'].map { |item| item['snippet']['channelTitle'] }
# p get_info("Travis Scott")['items'].map { |item| item['snippet']['thumbnails']['high']['url'] }

def autocomplete(query)
  url = "http://suggestqueries.google.com/complete/search?client=firefox&ds=yt&q=#{query}"
  result = open(url).read
  JSON.parse(result)
end

p autocomplete('Travis')
