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
    get :menu
    assert_response :success
  end

  test "nonlogged in user should not be able to submit solution" do
    post :evaluate, {'id' => '1'}
    assert_response :redirect
  end

  test "logged in user should be able to submit solution" do
    sign_in @user
    post :evaluate, {'id' => '1'}
    assert_response :success
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
