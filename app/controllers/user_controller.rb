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
    # Find an existing object using form params.
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

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, 
        :password, :password_confirmation)
    end


end
