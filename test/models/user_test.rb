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
  #validates presence of password
  test "should not save user without password" do
    user = User.new
    assert_not user.save, "Saved the user without a password"
  end
  #validates presence of password_confirmation
  test "should not save user without password_confirmation" do
    user = User.new
    assert_not user.save, "Saved the user without a password_confirmation"
  end
  #validates password and password_confirmation match
  test "should not save user if password and password_confirmation do not match" do
    user = User.new
    user.password
    user.password_confirmation
    assert_not user.save, "Saved the user if password and password_confirmation do not match"
  end
end
