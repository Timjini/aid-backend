require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @request = requests(:one)
  end

  test "should get index" do
    get api_v1_requests_url
    assert_response 200
  end


  test "should not create new if signed out" do
    sign_out users(:one)
    assert_no_difference('Request.count') do
      post api_v1_requests_url, params: { request: { } }
    end

    assert_response 401
  end

  test "should show request" do
    sign_out users(:one)
    get api_v1_request_url(@request)
    assert_response :success
  end

end
