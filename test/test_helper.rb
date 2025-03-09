ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "faker"
require "factory_bot"

module ActiveSupport
  class TestCase
    include Devise::Test::IntegrationHelpers
    include FactoryBot::Syntax::Methods
    parallelize(workers: :number_of_processors)

    Faker::Config.random = Random.new

    FactoryBot.find_definitions
  end
end
