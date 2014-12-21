require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
 
 test "should get impressum" do
    get :impressum
    assert_response :success
  end
 
 test "should get home" do
    get :home
    assert_response :success
  end

  test "should get status" do
    get :status
    assert_response :success
  end

end
