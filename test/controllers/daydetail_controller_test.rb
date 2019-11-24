require 'test_helper'

class DaydetailControllerTest < ActionDispatch::IntegrationTest
  test "should get day" do
    get daydetail_day_url
    assert_response :success
  end

end
