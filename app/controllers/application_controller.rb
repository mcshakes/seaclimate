class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  # before_action :authorize!
  # This doesn't le me route back, "saying i can't redirect properly"

  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end

  def authorize!
    redirect_to root_path unless current_user && params[:controller] = "home"
  end
end
