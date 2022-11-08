require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @request = requests(:one)
  end

  test "should get index" do
    get requests_url, as: :json
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post requests_url, params: { request: { address: @request.address, description: @request.description, fulfillment: @request.fulfillment, kind: @request.kind, latitude: @request.latitude, longitude: @request.longitude, situation: @request.situation, user_id: @request.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show request" do
    get request_url(@request), as: :json
    assert_response :success
  end

  test "should update request" do
    patch request_url(@request), params: { request: { address: @request.address, description: @request.description, fulfillment: @request.fulfillment, kind: @request.kind, latitude: @request.latitude, longitude: @request.longitude, situation: @request.situation, user_id: @request.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete request_url(@request), as: :json
    end

    assert_response 204
  end
end
