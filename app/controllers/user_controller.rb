class UserController < ApplicationController

 def create
    # Instantiate a new object using form params.
    @user = User.new(user_params)
    # Save the object.
    if @user.save
      # If the save succeeds, login the user and redirect to home.
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to(:action => 'index', :controller => 'main')
    else
      # If the save fails, redisplay the form with fields filled in.
      render('account/register')
    end
  end

  def update
    # Find an existing object using request params.
    @user = User.find(params[:id])
    # Update object.
    if @user.update_attributes(user_params)
      # If the update succeeds, redirect to home with success message.
      flash[:noticeMessage] = "Your account settings have been successfully saved."
      flash[:noticeTone] = "positive"
      redirect_to(:action => 'index', :controller => 'main')
    else
      # If the update fails, redisplay the form with fields filled in.
      flash[:noticeMessage] = "There was an issue with one of the input fields."
      flash[:noticeTone] = "negative"
      render('account/settings')
    end
  end

  def update_password
    # Find an existing object using request params
    @user = User.find(params[:id])
    # Authenticate user.
    @user = @user.authenticate(params[:old_password])
    if @user
      # Correct password. Update the user model.
      if @user.update_attributes(user_update_password_params)
        # If the update succeeds, redirect to home with success message.
        flash[:noticeMessage] = "Password successfully changed."
        flash[:noticeTone] = "positive"
        redirect_to(:action => 'index', :controller => 'main')
      else
        # If the update fails, redisplay the form with fields filled in.
        flash[:noticeMessage] = "There was a problem updating your password."
        flash[:noticeTone] = "negative"
        render('account/change_password')
      end
    else
      # Incorrect password. Redisplay the form with errors, and a failure message.
      @user = User.find(params[:id])
      flash[:noticeMessage] = "You did not enter your password correctly."
      flash[:noticeTone] = "negative"
      render('account/change_password')
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, 
        :password, :password_confirmation)
    end

    def user_update_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end


end
