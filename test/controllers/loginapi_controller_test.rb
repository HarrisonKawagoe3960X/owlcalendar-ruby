require 'test_helper'

class LoginapiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loginapi_index_url
    assert_response :success
  end

end
