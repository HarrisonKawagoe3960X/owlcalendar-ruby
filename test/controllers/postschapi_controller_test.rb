require 'test_helper'

class PostschapiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postschapi_index_url
    assert_response :success
  end

end
