class CreateListingOwnerships < ActiveRecord::Migration
  def change
    create_table :listing_ownerships do |t|
      t.integer 'user_id'
      t.string 'title'
      t.string 'listing_base_url'
      t.integer 'display_per_page'
      t.timestamps
    end
    add_index 'listing_ownerships', 'user_id'
  end
end
