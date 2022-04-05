require "test_helper"

class AsksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ask = asks(:one)
  end

  test "should get index" do
    get asks_url, as: :json
    assert_response :success
  end

  test "should create ask" do
    assert_difference('Ask.count') do
      post asks_url, params: { ask: { address: @ask.address, description: @ask.description, fulfillment: @ask.fulfillment, kind: @ask.kind, latitude: @ask.latitude, longitude: @ask.longitude, user_id_id: @ask.user_id_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ask" do
    get ask_url(@ask), as: :json
    assert_response :success
  end

  test "should update ask" do
    patch ask_url(@ask), params: { ask: { address: @ask.address, description: @ask.description, fulfillment: @ask.fulfillment, kind: @ask.kind, latitude: @ask.latitude, longitude: @ask.longitude, user_id_id: @ask.user_id_id } }, as: :json
    assert_response 200
  end

  test "should destroy ask" do
    assert_difference('Ask.count', -1) do
      delete ask_url(@ask), as: :json
    end

    assert_response 204
  end
end
