require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  # def setup
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  # end
  #
  def setup
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => "twitter",
      :nickname => "wetwillie"
      })
  end

  test "should create new user" do
    skip
    get :create, nickname: "wetwillie"

    assert_equal session[:user_id], "wetwillie"
    assert_redirected_to user_path(nickname: "wetwillie")
  end


end
