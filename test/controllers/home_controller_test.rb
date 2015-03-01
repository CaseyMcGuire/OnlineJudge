require 'test_helper'

class HomeControllerTest < ActionController::TestCase


  test "should get home" do
    get :welcome
    assert_response :success
    #more stuff about the home page
  end

  test "should get faq" do
    
  end

end
