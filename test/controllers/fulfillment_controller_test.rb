require "test_helper"

class FulfillmentsControllerTest < ActionDispatch::IntegrationTest
    setup do
        sign_in users(:one)
        @fulfillment = fulfillments(:one)
    end

    
    test "should not create new if signed out" do
        sign_out users(:one)
        assert_no_difference('Fulfillment.count') do
        post api_v1_fulfillments_url, params: { fulfillment: { } }
        end
    
        assert_response 401
    end
    
    test "should not show fulfillment" do
        sign_out users(:one)
        get api_v1_fulfillment_url(@fulfillment)
        assert_response 401
    end
        
end