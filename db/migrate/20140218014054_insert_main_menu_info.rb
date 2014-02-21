class InsertMainMenuInfo < ActiveRecord::Migration
  def change

    add_column :menu_items, :menu_id, :integer

    defaultMenu = Menu.create :identifier_string => 'default'
    
    menuItem1 = MenuItem.create :identifier_string => 'defaultFeed', :display_name => 'Default Feed', :position => 1, :description => 'Display content from all feeds.', :link_action => 'default', :link_controller => 'feed'
    menuItem2 = MenuItem.create :identifier_string => 'manageFeeds', :display_name => 'Manage My Feeds', :position => 2, :description => 'Display listing of feeds.', :link_action => 'listing', :link_controller => 'feed'
    menuItem3 = MenuItem.create :identifier_string => 'displayAllFeedListingSubscriptions', :display_name => '', :position => 4, :description => 'Display all feed subscriptions.', :link_action => 'default', :link_controller => 'feed'
    
    defaultMenu.menu_items << menuItem1
    defaultMenu.menu_items << menuItem2
    defaultMenu.menu_items << menuItem3

  end
end
