class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :logged_in?, :current_order
  include SessionsHelper


  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
      end
  end

  protected
  def authorize
    unless current_user.admin?
      flash[:error] = "unauthorized access"
        redirect_to root_path
      end
  end

  def admin?
    current_user.admin
  end
end
#can use request.remote_ip == "" for admin?
