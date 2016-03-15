class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_order
  include SessionsHelper

  helper_method :admin?

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
      end
  end

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
