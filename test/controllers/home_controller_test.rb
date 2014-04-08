require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should not login get index" do
    get :index
    assert_response :success
    assert_equal [], assigns['items']
  end

  test "should login get index" do
    user = users(:one)
    sign_in user
    get :index
    assert_response :success
    assert_equal user.items, assigns['items']
  end

end
