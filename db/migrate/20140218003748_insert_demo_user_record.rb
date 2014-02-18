class InsertDemoUserRecord < ActiveRecord::Migration
  def change
    User.create :first_name => 'Demo', :last_name => 'User', :email => 'demo@nowhere.com', :username => 'demo', :password => 'thisisapoorlychosenpassword', :password_confirmation => 'thisisapoorlychosenpassword'
  end
end
