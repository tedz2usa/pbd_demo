class CreateDemoUserWithDefaultValues < ActiveRecord::Migration
  def change
    @user = User.create :first_name => 'Demo', :last_name => 'User', :email => 'demo@nowhere.com', :username => 'demo', :password => 'badpassword', :password_confirmation => 'badpassword'

    # Create four new listing ownerships, and save a default one for the user.
    l1 = ListingOwnership.new(:display_per_page => 25, :view_aspect => 'hot', :user_id => @user.id)
    l2 = ListingOwnership.new(:display_per_page => 25, :view_aspect => 'hot', :user_id => @user.id)
    l3 = ListingOwnership.new(:display_per_page => 25, :view_aspect => 'hot', :user_id => @user.id)
    l4 = ListingOwnership.new(:display_per_page => 25, :view_aspect => 'hot', :user_id => @user.id)
    
    l1.position = 1
    l2.position = 2
    l3.position = 3
    l4.position = 4

    l1.listing_base_url = 'http://reddit.com/'
    l2.listing_base_url = 'http://reddit.com/r/technology/'
    l3.listing_base_url = 'http://reddit.com/r/pics/'
    l4.listing_base_url = 'http://reddit.com/r/aww/'

    l1.title = 'Reddit Front Page'
    l2.title = SubredditBrowser.get_display_name(l2.listing_base_url)
    l3.title = SubredditBrowser.get_display_name(l3.listing_base_url)
    l4.title = SubredditBrowser.get_display_name(l4.listing_base_url)

    l1.removable = false;

    l1.save
    l2.save
    l3.save
    l4.save

    @user.default_listing_ownership_id = l1.id

    @user.save

  end
end
