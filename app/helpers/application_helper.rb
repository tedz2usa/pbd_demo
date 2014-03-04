module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', 
      :locals => {:object => object})
  end

  def display_page_menu(menu)
    render(:partial => 'application/page_menu',
      :locals => {:menu => menu})
  end

  def display_listing_items(listingItems)
    listingItems.each do |item|
      # render(:partial => 'application/output_feed_listing_item',
      #   :locals => {:item => listingItems.first})
    end
    # listingItems.each do |item|
    #   render(:partial => 'application/output_feed_listing_item',
    #     :locals => {:item => item})
    # end
    return 'hello'
  end

  def display_listing_item(listingItem)
    render(:partial => 'application/output_feed_listing_item',
        :locals => {:item => listingItem})
  end

end
