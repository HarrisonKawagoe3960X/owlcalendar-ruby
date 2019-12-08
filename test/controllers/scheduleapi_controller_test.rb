require 'test_helper'

class ScheduleapiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scheduleapi_index_url
    assert_response :success
  end

end
