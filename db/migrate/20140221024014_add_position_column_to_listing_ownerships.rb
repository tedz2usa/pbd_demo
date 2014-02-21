class AddPositionColumnToListingOwnerships < ActiveRecord::Migration
  def change
    add_column 'listing_ownerships', 'position', :integer
  end
end
