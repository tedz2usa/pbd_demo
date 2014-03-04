class AddDefaultFeedToUsers < ActiveRecord::Migration
  def change
    add_column 'users', 'default_listing_ownership_id', :integer
  end
end
