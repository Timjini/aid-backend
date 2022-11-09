require "test_helper"

class UserTest < ActiveSupport::TestCase
  #validates presence of username
  test "should not save user without username" do
    user = User.new
    assert_not user.save, "Saved the user without a username"
  end
  #validates presence of email
  test "should not save user without email" do
    user = User.new
    assert_not user.save, "Saved the user without a email"
  end
end
