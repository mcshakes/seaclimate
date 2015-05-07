require 'test_helper'
OmniAuth.config.test_mode = true

class UserLoginTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

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
    click_link_or_button "Log In With Twitter"
    fill_in("Number", with: "+19707691296")
    click_link_or_button "Add Number"
    assert page.has_content?("Your Trips")
  end
end
