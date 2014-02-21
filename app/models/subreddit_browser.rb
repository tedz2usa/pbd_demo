require 'rest_client'
require 'pp'

class SubredditBrowser

  def self.get
    response = RestClient.get 'http://reddit.com/subreddits/popular.json?limit=50'
    raw_hash = JSON.parse(response.to_str)
    children = raw_hash['data']['children']
    #pp children
    subreddits = Array.new

    children.each do |subreddit_hash|
      subreddit = Subreddit.new(subreddit_hash)
      subreddits << subreddit unless subreddit.nsfw
    end

    # subreddits.each do |subreddit|
    #   puts subreddit.title_description
    # end

    return subreddits

  end

  def self.get_title(base_url)
    response = RestClient.get base_url + 'about.json'
    raw_hash = JSON.parse(response.to_str)
    return raw_hash['data']['title']
  end

  def self.get_display_name(base_url)
    response = RestClient.get base_url + 'about.json'
    raw_hash = JSON.parse(response.to_str)
    return raw_hash['data']['display_name']
  end



end