require 'test_helper'

class FeedControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get listing" do
    get :listing
    assert_response :success
  end

end
