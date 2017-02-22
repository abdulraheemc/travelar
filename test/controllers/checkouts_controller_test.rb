require 'test_helper'

class CheckoutsControllerTest < ActionController::TestCase
  test "should get stripe_checkout" do
    get :stripe_checkout
    assert_response :success
  end

end
