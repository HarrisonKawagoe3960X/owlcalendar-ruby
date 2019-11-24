require 'test_helper'

class NewscheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get newschedule_index_url
    assert_response :success
  end

end
