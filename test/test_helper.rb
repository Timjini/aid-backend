ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
  ActiveRecord::Migration.maintain_test_schema!
end
