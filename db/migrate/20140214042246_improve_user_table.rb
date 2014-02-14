class ImproveUserTable < ActiveRecord::Migration
  def change

  	add_column('users', 'username', :string, :limit => 25)
  	add_index('users', 'username')
  	
  end
end
