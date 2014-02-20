class ListingOwnershipController < ApplicationController

  def new
    @listingOwnership = ListingOwnership.new(:display_per_page => 25, :view_aspect => 'hot')
    @subreddits = SubredditBrowser.get
  end

  def create
    # Instantiate a new ListingOwnership using form parameters
    @listingOwnership = ListingOwnership.new(listing_ownership_params_new)
    puts @listingOwnership
    @listingOwnership.user_id = session[:user_id]
    @listingOwnership.title = SubredditBrowser.get_title(@listingOwnership.listing_base_url)
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
  end

  def update
    # Find an existing listingOwnership using request params.
    @listingOwnership = ListingOwnership.find(params[:id])
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
    redirect_to({:action => 'listing', :controller => 'feed'});
  end


  private

    def listing_ownership_params_update
      params.require(:listingOwnership).permit(:display_per_page, :view_aspect)
    end

    def listing_ownership_params_new
      params.require(:listingOwnership).permit(:display_per_page, :view_aspect, :listing_base_url, :title)
    end


end
