require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get schedules_main_url
    assert_response :success
  end

end
