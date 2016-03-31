module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    @cart = current_user.cart if logged_in?
  end
end
