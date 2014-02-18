class FeedController < ApplicationController
  def all
    reddit_feed = RedditFeed.new('http://reddit.com/hot.json')
    reddit_feed.getListingItems
    @listingItems = reddit_feed.feed_items
  end

  def listing
  end
end
