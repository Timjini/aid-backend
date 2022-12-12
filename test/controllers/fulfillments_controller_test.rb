require "test_helper"

class FulfillmentsControllerTest < ActionDispatch::IntegrationTest
    setup do
        sign_in users(:one)
        @fulfillment = fulfillment(:one)
        #define a fulfillment
        @fulfillment = Fulfillment.new
    end

    #test fulfillment controller actions
    # test "should get index" do
    #     get fulfillments_url
    #     assert_response :success
    # end

    # test "should get new" do
    #     get api_v1_fulfillments
    #     assert_response :success
    # end
end