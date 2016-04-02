class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all 
  end

  def new
    if current_user.cart.line_items.empty?
        redirect_to root_path, notice: "Your cart is empty"
            return
        end
        @order = Order.new
    end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        current_user.cart.destroy
        session[:cart_id] = nil

        format.html { redirect_to root_path, notice:
              'Thank you for your order.'}
        format.json { render action: 'show', status: :created,
              location: @order}
        else
          format.html {render action: 'new'}
          format.json {render json: @order.errors,
                status: :unprocessable_entity}
      end
    end
  end
  private
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
