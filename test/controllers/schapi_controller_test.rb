require 'test_helper'

class SchapiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schapi_index_url
    assert_response :success
  end

end
