require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @request = requests(:one)
  end

  test "should get index" do
    get api_v1_requests_url
    assert_response :success
  end


  test "should show request" do
    sign_out users(:one)
    get api_v1_request_url(@request)
    assert_response :success
  end

end
