class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  include SessionsHelper

  helper_method :admin?

  protected
  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
        redirect_to root_path
        false
      end
  end

  def admin?
    current_user.first_name == "J@oniax$" && current_user.last_name == "J@@M**R"
  end
end
#can use request.remote_ip == "" for admin?
