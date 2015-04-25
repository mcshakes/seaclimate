require 'test_helper'
OmniAuth.config.test_mode = true

# require 'omniauth_hash'

class UserLoginTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  # # include OmniauthHash

  def mock_auth_hash
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      "provider" => "twitter",
      "uid"      => "12345",
      "info" => {
        "nickname" => "fakemocker",
        "image" => "fake_mocker_thumbnail"
      },
      "credentials" => {
        "token"   => "mock_token",
        "secret"  => "mock_secret"
      }
      })
  end

  def setup
    OmniAuth.config.mock_auth[:twitter] = nil
    mock_auth_hash
  end

  test "user can login with twitter" do
    visit root_path
    click_link_or_button "Log In"
    assert_equal current_path, dashboard_path
    assert page.has_content?("Login with Twitter")
  end

  test "it clicks and authorizes through twitter" do
    visit root_path
    click_link_or_button "Log In"
    click_link_or_button "Login with Twitter"
    assert page.has_content?("fakemocker")
    # assert_equal user_path(id: user.id), current_path
  end


end
