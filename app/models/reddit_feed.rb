# require 'open-uri'
require 'rest_client'
require 'pp'

class RedditFeed

  attr_accessor :feed_url, :feed_items, :listing_after, :listing_before

  # E.g., 'http://reddit.com/hot.json'
  def initialize(url)
    @feed_url = url
    @feed_items = Array.new
  end

  def getListingItems
    response = RestClient.get @feed_url
    raw_hash = JSON.parse(response.to_str)

    children = raw_hash['data']['children']
    @listing_after = raw_hash['data']['after']
    @listing_before = raw_hash['data']['before']


    #pp raw_hash
    #puts '@listing_after = ' + @listing_after.to_s
    #puts '@listing_before = ' + @listing_before.to_s


    children.each do |child|
      listingItem = ListingItem.new(child)
      @feed_items << listingItem unless listingItem.nsfw # do not add if NSFW
      nil
    end

  end


  
  
end