require 'test_helper'

class UserLoginTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    
    OmniAuth.config.mock_auth[:twitter] = nil
  end
end
