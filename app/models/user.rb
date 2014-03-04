class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_format_of :email, :with => /@/
  validates_presence_of :username
  validates_length_of :username, :minimum => 3
  validates_presence_of :password, :if => :validate_password?
  validates_length_of :password, :minimum => 6, :if => :validate_password?
  validates_length_of :password, :maximum => 255, :if => :validate_password?

  def validate_password?
    password.present? || password_confirmation.present?
  end




end
