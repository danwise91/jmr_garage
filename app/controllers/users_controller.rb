class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render 'new'
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to @user
      end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :admin, :last_name, :email, :password, :password_confirmation, :phone_number, :address_one, :address_two, :city, :country, :state, :zip)
    end
end
