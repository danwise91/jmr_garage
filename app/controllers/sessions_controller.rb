class SessionsController < ApplicationController
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
      @user = User.new if @user.blank?
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
          redirect_to @user
      else
        flash[:notice] = "Failed to login, please try again"
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
