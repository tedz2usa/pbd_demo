class AccountController < ApplicationController
  
  def index
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authenticated_user = found_user.authenticate(params[:password])
      end
    end
    if authenticated_user
      # Mark user as logged in
      session[:user_id] = authenticated_user.id
      session[:username] = authenticated_user.username
      flash[:noticeMessage] = "You are now logged in."
      flash[:noticeTone] = "positive"
      redirect_to(:action => 'default', :controller => 'feed')
    else
      flash[:noticeMessage] = "Invalid username/password combination."
      flash[:noticeTone] = "negative"
      session[:username] = params[:username]
      redirect_to(:action => 'login')
    end
  end

  def logout
    # Mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:noticeMessage] = "You have been logged out"
    flash[:noticeTone] = 'positive'
    redirect_to(:action => "index", :controller => "main")
  end

  def settings
    @user = User.find(session[:user_id])
  end

  def change_password
    @user = User.find(session[:user_id])
  end

  def register
    @user = User.new
  end

end
