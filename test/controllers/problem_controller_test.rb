require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  
  def setup
    #@user = users(:not_admin)
    #@admin = users(:admin)
    #@problem = problems(:first_problem)
  end

  test "nonlogged in user should be able to see problems" do
    get :menu
    assert_response :success
  end

  test "logged in user should be able to see problems" do
    
    get :menu
    assert_response :success
  end

  test "nonlogged in user should not be able to submit solution" do
  end

  test "nonadmin should not be able to edit problem" do
    #get :edit
    #assert_response :failure
  end
end
