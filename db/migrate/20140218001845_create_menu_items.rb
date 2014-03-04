class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :display_name
      t.string :description
      t.string :link_action
      t.string :link_controller
      t.timestamps
    end
  end
end
