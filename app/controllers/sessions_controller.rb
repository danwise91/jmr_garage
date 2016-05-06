class SessionsController < ApplicationController
  class NoPasswordException < Exception
  end

  def new
    @user = User.new
  end

  def create
  if params[:provider] ==  "facebook"
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  else
    @user = User.find_by(email: params[:user][:email])

    raise NoPasswordException if params[:user][:password].blank?
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if @user.cart
        @cart = @user.cart
      else
        @user.cart = Cart.create
      end
      @user.save
      redirect_to @user
    else
      flash[:notice] = "Failed to login, please try again"
      redirect_to login_path
    end
  end
  rescue NoPasswordException
    flash.now[:notice] = "No password"
    redirect_to login_path
end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
