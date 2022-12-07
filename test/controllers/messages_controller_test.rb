require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
    setup do
        sign_in users(:one)
        @message = messages(:one)
    end


end