# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start
require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require "pry"
require "vcr"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "fixtures/vcr_cassettes"
    config.hook_into :faraday
    config.allow_http_connections_when_no_cassette = true
  end

end

OmniAuth.config.test_mode = true
