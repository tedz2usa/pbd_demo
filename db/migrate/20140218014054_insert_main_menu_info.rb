class InsertMainMenuInfo < ActiveRecord::Migration
  def change

    add_column :menu_items, :menu_id, :integer

    defaultMenu = Menu.create :identifier_string => 'default'
    
    menuItem1 = MenuItem.create :identifier_string => 'allFeeds', :display_name => 'From All My Feeds', :position => 1, :description => 'Display content from all feeds.', :link_action => 'all', :link_controller => 'feed'
    menuItem2 = MenuItem.create :identifier_string => 'manageFeeds', :display_name => 'Manage My Feeds', :position => 2, :description => 'Display listing of feeds.', :link_action => 'listing', :link_controller => 'feed'
    
    defaultMenu.menu_items << menuItem1
    defaultMenu.menu_items << menuItem2

  end
end
