class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_format_of :email, :with => /@/
  validates_presence_of :username
  validates_length_of :username, :minimum => 3
  validates_presence_of :password
  validates_length_of :password, :minimum => 6
  validates_length_of :password, :maximum => 255




end
