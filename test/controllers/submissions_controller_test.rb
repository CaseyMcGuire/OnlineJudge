require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase

    def setup
    @user = users(:not_admin)
    @admin = users(:admin)
    @problem = problems(:first_problem)
  end

  test "nonlogged in user should not be able to submit solution" do
    params = {:format => 'json', 'id' => '1'}
    post :new, params
    assert_response :unauthorized
  end

  test "logged in user should be able to submit solution" do
    sign_in @user
    params = {:format => 'json', 'id' => '1'}
    post :new, params
    assert_response :success
  end


end
