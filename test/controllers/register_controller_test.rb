require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get register_main_url
    assert_response :success
  end

end
