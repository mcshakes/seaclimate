class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(auth_hash)

    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    sign_out
  end


  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
    flash[:error] = "signed out"
  end
end
