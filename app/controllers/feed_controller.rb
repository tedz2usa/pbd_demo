class FeedController < ApplicationController
  def default
    listingOwnership = ListingOwnership.find(User.find(session[:user_id]).default_listing_ownership_id)
    @lvp = ListingViewPreparer.new(listingOwnership, params)
    
  end

  def listing
    @listingOwnerships = ListingOwnership.ordered.find_all_by_user_id(session[:user_id])
  end

  def view
    listingOwnership = ListingOwnership.find(params[:id])
    @lvp = ListingViewPreparer.new(listingOwnership, params)
  end

end
