require 'spec_helper'

describe AccountController do

  describe 'POST attempt_login' do

    context 'when both username and password information are provided' do

      before(:each) do 
        user = mock_model(User).as_null_object
        user.stub(:id).and_return(1)
        user.stub(:username).and_return('demo')
        User.stub_chain(:where, :first).and_return(user)
      end

      it 'looks for the user in the database' do
        User.should_receive(:where).once
        post :attempt_login, :username => 'demo', :password => 'badpassword'
      end

      context 'when correct user account credentials are provided' do
        before(:each) do
          post :attempt_login, :username => 'demo', :password => 'badpassword'
        end

        it 'stores the user_id and username in the session hash' do
          session[:user_id].should == 1
          session[:username].should == 'demo'
        end

        it 'assigns a success message to the flash hash' do
          flash[:noticeMessage].should == "You are now logged in."
          flash[:noticeTone].should == 'positive'
        end

        it 'redirects to default feed' do
          response.should redirect_to(:action => 'default', :controller => 'feed')
        end
      end

      context 'when incorrect user account credentials are provided' do
        before(:each) do
          User.stub_chain(:where, :first, :authenticate).and_return(nil)
          post :attempt_login, :username => 'demo', :password => 'incorrect'
        end

        it 'does not store any user_id in the session hash' do
          session[:user_id].should == nil
        end

        it 'assigns a failure message to the flash hash' do
          flash[:noticeMessage].should == "Invalid username/password combination."
          flash[:noticeTone].should == 'negative'
        end

        it 'redirects back to login page' do
          response.should redirect_to(:action => 'login')
        end
      end
    end

    context 'when only one piece of information is provided' do
      it 'does not look for the user in the database' do
        User.should_not_receive(:where)
        post :attempt_login, :username => 'demo', :password => ''
      end

      it 'assigns a failure message to the flash hash' do
        post :attempt_login, :username => 'demo', :password => ''
        flash[:noticeMessage].should == "Invalid username/password combination."
        flash[:noticeTone].should == 'negative'
      end

      it 'redirects back to login page' do
        post :attempt_login, :username => 'demo', :password => ''
        response.should redirect_to(:action => 'login')
      end
    
    end
    
  end


end



