require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  # def setup
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  # end
  #

  def mock_auth_hash
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      "provider" => "twitter",
      "uid"      => "12345",
      "user_info" => {
        "nickname" => "fakemocker",
        "image" => "fake_mocker_thumbnail"
      },
      "credentials" => {
        "token"   => "mock_token",
        "secret"  => "mock_secret"
      }
      })
  end

  def create_user
    OmniAuth.config.mock_auth[:twitter] = nil
    mock_auth_hash
    get :create
  end

  test "should create new user" do
    create_user
    assert_equal session[:user_id], "fakemocker"
    # assert_redirected_to user_path(nickname: "fakemocker")
  end


end
