class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
    @cart = Cart.find(params[:id])
  end

  def edit
    @cart = Cart.new(cart_params)
  end

  def update
    @cart = Cart.find(params[:id])
      if @cart.update_attributes(cart_params)
        redirect_to @cart
      end
  end

  def destroy
    current_user.cart.destroy
    current_user.cart = Cart.create
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
  end
end

  private
  def cart_params
    params.require(:cart).permit(:user_id)
    end

   def invalid_cart
     logger.error "Attempt to access invalid cart #{params[:id]}"
     redirect_to root_path, notice: "Invalid cart"
   end
end
