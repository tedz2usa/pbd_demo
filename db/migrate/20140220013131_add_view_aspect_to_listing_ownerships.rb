class AddViewAspectToListingOwnerships < ActiveRecord::Migration
  def change
    add_column 'listing_ownerships', 'view_aspect', :string
  end
end
