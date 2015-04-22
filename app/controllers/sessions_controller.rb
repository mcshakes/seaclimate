class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env["omniauth.auth"])
  end

  if user
    session[:user_id] = user.id
    redirect_to root_path
  else
    redirect_to root_path
  end
end
