class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :identifier_string
      t.timestamps
    end
    add_index :menus, :identifier_string
  end
end
