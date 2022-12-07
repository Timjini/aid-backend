requite 'test_helper'

class UsersTest < ActiveSupport::TestCase
    setup do
        #login user
        sign_in users(:one)
        @user = users(:one)
    end

    test "should get index" do
        get api_v1_users_url
        assert_response 200
    end

    test "should show user" do
        get api_v1_user_url(@user)
        assert_response :success
    end

    test "should not create new if signed out" do
        sign_out users(:one)
        assert_no_difference('User.count') do
            post api_v1_users_url, params: { user: { }}
        end
    end
end