require "test_helper"

class FulfillmentsControllerTest < ActionDispatch::IntegrationTest
    setup do
        sign_in users(:one)
        @fulfillment = fulfillments(:one)
    end

    # test "should get index" do
    #     get api_v1_fulfillments_url
    #     assert_response :success
    # end

end