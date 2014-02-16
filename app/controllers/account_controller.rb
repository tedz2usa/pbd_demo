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
      # TODO: mark user as logged in
      session[:user_id] = authenticated_user.id
      session[:username] = authenticated_user.username
      flash[:noticeMessage] = "You are now logged in."
      flash[:noticeTone] = "positive"
      redirect_to(:action => 'index')
    else
      flash[:noticeMessage] = "Invalid username/password combination."
      flash[:noticeTone] = "negative"
      redirect_to(:action => 'login')
    end
  end

  def logout
    # TODO: mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end
