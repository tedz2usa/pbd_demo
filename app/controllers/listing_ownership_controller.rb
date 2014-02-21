class ListingOwnershipController < ApplicationController

  def new
    @listingOwnershipCount = ListingOwnership.count + 1
    @listingOwnership = ListingOwnership.new(:display_per_page => 25, :view_aspect => 'hot', :position => @listingOwnershipCount)
    subredditsAll = SubredditBrowser.get
    

    # Remove listings that the user has already subscribed to.
    listingOwnerships = ListingOwnership.ordered.find_all_by_user_id(session[:user_id])
    owned_urls = Array.new
    listingOwnerships.each do |listing|
      owned_urls << listing.listing_base_url
    end
    @subreddits = Array.new
    subredditsAll.each do |subreddit|
      cutoff_length = 70
      if subreddit.title_description.length > cutoff_length
        subreddit.title_description = subreddit.title_description[0..cutoff_length] + '...' 
      end
      if !(owned_urls.include? subreddit.base_url)
        @subreddits << subreddit
      end
    end

  end

  def create
    # Instantiate a new ListingOwnership using form parameters
    @listingOwnership = ListingOwnership.new(listing_ownership_params_new)
    @listingOwnershipCount = ListingOwnership.count + 1
    puts @listingOwnership
    @listingOwnership.user_id = session[:user_id]
    @listingOwnership.title = SubredditBrowser.get_display_name(@listingOwnership.listing_base_url)
    # Save object.
    if @listingOwnership.save
      # If the save succeeds, redirect to listings.
      flash[:noticeMessage] = "Listing subscription has been successfully added."
      flash[:noticeTone] = "positive"
      redirect_to(:action => 'listing', :controller => 'feed')
    else
      # If the update fails, redisplay the form with fields filled in.
      flash[:noticeMessage] = "There was an issue with one of the input fields."
      flash[:noticeTone] = "negative"
      render('listing_ownership/new')
    end
  end

  def edit
    @listingOwnership = ListingOwnership.find_by_id(params[:id])
    @listingOwnershipCount = ListingOwnership.count
  end

  def update
    # Find an existing listingOwnership using request params.
    @listingOwnership = ListingOwnership.find(params[:id])
    @listingOwnershipCount = ListingOwnership.count
    # Update object.
    if @listingOwnership.update_attributes(listing_ownership_params_update)
      # If the update succeeds, redirect to home with success message.
      flash[:noticeMessage] = "Listing subscription settings have been successfully saved."
      flash[:noticeTone] = "positive"
      redirect_to(:action => 'listing', :controller => 'feed')
    else
      # If the update fails, redisplay the form with fields filled in.
      flash[:noticeMessage] = "There was an issue with one of the input fields."
      flash[:noticeTone] = "negative"
      render('listing_ownership/edit')
    end
  end

  def delete
    @listingOwnership = ListingOwnership.find(params[:id])
  end

  def destroy
    @listingOwnership = ListingOwnership.find(params[:id])
    @listingOwnership.destroy
    flash[:noticeMessage] = "Listing subscription successfully removed."
    flash[:noticeTone] = "positive"
    redirect_to({:action => 'listing', :controller => 'feed'})
  end


  def set_default
    user = User.find(session[:user_id])
    #user.default_listing_ownership_id = params[:id]
    if user.update_attribute(:default_listing_ownership_id, params[:id])
      flash[:noticeMessage] = "Successfully updated default feed subscription."
      flash[:noticeTone] = "positive"
      redirect_to({:action => 'listing', :controller => 'feed'})
    else
      flash[:noticeMessage] = "Something went wrong."
      flash[:noticeTone] = "negative"
      puts user.errors.full_messages
      redirect_to({:action => 'listing', :controller => 'feed'})

    end
  end

  private

    def listing_ownership_params_update
      params.require(:listingOwnership).permit(:display_per_page, :view_aspect, :position)
    end

    def listing_ownership_params_new
      params.require(:listingOwnership).permit(:display_per_page, :view_aspect, :listing_base_url, :title, :position)
    end


end
