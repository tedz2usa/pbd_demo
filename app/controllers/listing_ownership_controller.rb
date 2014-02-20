class ListingOwnershipController < ApplicationController

  def edit
    @listingOwnership = ListingOwnership.find_by_id(params[:id])
  end

  def update
    # Find an existing listingOwnership using request params.
    @listingOwnership = ListingOwnership.find(params[:id])
    # Update object.
    if @listingOwnership.update_attributes(listing_ownership_params)
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


  private

    def listing_ownership_params
      params.require(:listingOwnership).permit(:display_per_page, :view_aspect)
    end


end
