# require 'open-uri'
require 'rest_client'
require 'pp'

class RedditFeed

  attr_accessor :feed_url, :feed_items

  # E.g., 'http://reddit.com/hot.json'
  def initialize(url)
    @feed_url = url
    @feed_items = Array.new
  end

  def getListingItems
    response = RestClient.get @feed_url
    raw_hash = JSON.parse(response.to_str)
    children = raw_hash['data']['children']

    pp children
    
    children.each do |child|
      listingItem = ListingItem.new(child)
      @feed_items << listingItem unless listingItem.nsfw # do not add if NSFW
      nil
    end

  end


  # # Nokogiri::XML(open("http://reddit.com/hot.xml"))
  # attr_accessor :feed_url, :feed_items

  # def initialize(url)
  #     @feed_url = url
  #     @feed_items = Array.new
  # end

  # def getListingItems(size)

  #   # Get Listing Items
  #   listing = Nokogiri::XML(open(@feed_url))
  #   root = listing.children
  #   channel = root.children
  #   items = channel.children

  #   # For each child, if the child has a node label of "item", 
  #   items.each do |item|
  #     if item.node_name == 'item'
  #       # Add the listing item to the "@feed_items" array.
  #       @feed_items << ListingItem.new(item)
  #     end
  #   end

  # end




  
  
end