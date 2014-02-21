class AddRemovableToListingOwnershipsIncludingDefaultEqualsTrue < ActiveRecord::Migration
  def change
    add_column 'listing_ownerships', 'removable', :boolean, :default => true
  end
end
