class UserController < ApplicationController

 def create
    puts 'CREATING!!'
    # Instantiate a new object using form params.
    @user = User.new(user_params)
    # Save the object.
    if @user.save
      # If the save succeeds, login the user and redirect to home.
      redirect_to(:action => 'index')
    else
      # If the save fails, redisplay the form with fields filled in.
      render('account/register')
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, 
        :password, :password_confirmation)
    end

  
end
