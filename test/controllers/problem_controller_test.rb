require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:not_admin)
    @admin = users(:admin)
    @problem = problems(:first_problem)
  end

  test "nonlogged in user should be able to see problems" do
    get :menu
    assert_response :success
  end

  test "logged in user should be able to see problems" do
    sign_in @user
    get :menu
    assert_response :success
  end

  test "nonlogged in user should not be able to submit solution" do
    params = {:format => 'json', 'id' => '1'}
    post :evaluate, params
    assert_response :unauthorized
  end

  test "logged in user should be able to submit solution" do
    sign_in @user
    params = {:format => 'json', 'id' => '1'}
    post :evaluate, params
    assert_response :success
  end

  test "nonlogged in user should not be able to check a submission" do
    
  end

  test "nonadmin should not be able to edit problem" do
    sign_in @user
    get :update, {'id' => '1'}
    assert_redirected_to problems_path
  end

  test "admin should be able to edit problem" do
    sign_in @admin 
    get :update, {'id' => '1'}
    assert_response :success
  end
end
