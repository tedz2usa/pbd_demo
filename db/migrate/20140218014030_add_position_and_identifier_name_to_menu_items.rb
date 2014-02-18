class AddPositionAndIdentifierNameToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :position, :integer
    add_column :menu_items, :identifier_string, :string
    add_index :menu_items, :identifier_string, :unique => true
    remove_index :users, :username
    add_index :users, :username, :unique => true
    remove_index :menus, :identifier_string
    add_index :menus, :identifier_string, :unique => true 
  end
end
