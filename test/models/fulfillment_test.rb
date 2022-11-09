require "test_helper"

class FulfillmentTest < ActiveSupport::TestCase
  #validates presence of text
  test "should not save fulfillment without text" do
    fulfillment = Fulfillment.new
    assert_not fulfillment.save, "Saved the fulfillment without a text"
  end
  # has a request
  test "should not save fulfillment without request" do
    fulfillment = Fulfillment.new
    assert_not fulfillment.save, "Saved the fulfillment without a request"
  end
end
