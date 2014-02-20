class FeedController < ApplicationController
  def default
    listingOwnership = ListingOwnership.find(User.find(session[:user_id]).default_listing_ownership_id)

    @lvp = ListingViewPreparer.new(listingOwnership, params)
    # ######################################
    # @after = params[:after]
    # @count = params[:count]
    # @before = params[:before]
    # @limit = params[:limit] || 25
    
    # after_param = 'after=' + @after.to_s if @after
    # count_param = 'count=' + @count.to_s if @count
    # before_param = 'before=' + @before.to_s if @before
    # limit_param = 'limit=25'
    # limit_param = 'limit=' + @limit.to_s if @limit

    # request_params = '?' + [after_param, count_param, before_param, limit_param].compact.join('&')


    # @base_url = 'http://reddit.com/hot.json'
    # reddit_feed = RedditFeed.new('http://reddit.com/hot.json' + request_params)
    # reddit_feed.getListingItems
    # @listingItems = reddit_feed.feed_items
    # @listingURL = reddit_feed.feed_url
    # @has_next = reddit_feed.listing_after
    # @has_previous = reddit_feed.listing_before
    # if @before
    #   @has_next_count = @count.to_i - 1
    #   @has_previous_count = @count.to_i - @limit.to_i
    # else
    #   @has_next_count = @count.to_i + @limit.to_i
    #   @has_previous_count = @count.to_i + 1
    # end

  end

  def listing
    @listingOwnerships = ListingOwnership.find_all_by_user_id(session[:user_id])
  end

  def view
    listingOwnership = ListingOwnership.find(params[:id])
    @lvp = ListingViewPreparer.new(listingOwnership, params)
    puts 'hello from view'

  end

end
