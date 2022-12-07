require "test_helper"

class RequestTest < ActiveSupport::TestCase
  #test model validations
  test "should not save request without description" do
    request = Request.new
    assert_not request.save, "Saved the request without a description"
  end

  test "should not save request without user" do
    request = Request.new
    request.description = "Test description"
    assert_not request.save, "Saved the request without a user"
  end
  
end
