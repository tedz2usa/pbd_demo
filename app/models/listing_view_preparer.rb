class ListingViewPreparer

  def initialize(listingOwnership, req_params)

    @after = req_params[:after]
    @count = req_params[:count]
    @before = req_params[:before]
    @limit = req_params[:limit] || 25
    
    after_param = 'after=' + @after.to_s if @after
    count_param = 'count=' + @count.to_s if @count
    before_param = 'before=' + @before.to_s if @before
    limit_param = 'limit=25'
    limit_param = 'limit=' + @limit.to_s if @limit

    request_params = '?' + [after_param, count_param, before_param, limit_param].compact.join('&')


    base_url = listingOwnership.listing_base_url
    feed_request_url = base_url + '/' + listingOwnership.view_aspect + '.json' + request_params
    puts feed_request_url

    reddit_feed = RedditFeed.new(feed_request_url)
    reddit_feed.getListingItems

    @listingItems = reddit_feed.feed_items
    @listingURL = reddit_feed.feed_url
    @has_next = reddit_feed.listing_after
    @has_previous = reddit_feed.listing_before
    @title = listingOwnership.title

    if @before
      @has_next_count = @count.to_i - 1
      @has_previous_count = @count.to_i - @limit.to_i
    else
      @has_next_count = @count.to_i + @limit.to_i
      @has_previous_count = @count.to_i + 1
    end

  end

  def title
    @title
  end

  def listingItems
    @listingItems
  end

  def nextLinkParams
    {:after => @has_next, :count => @has_next_count}
  end

  def previousLinkParams
    {:before => @has_previous, :count => @has_previous_count }
  end

  def hasNext
    return @has_next
  end

  def hasPrevious
    return @has_previous
  end



end