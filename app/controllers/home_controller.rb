class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @categories = Category.all
    @parts = Part.all
    @parts = @parts.search(params[:search]) if params[:search].present?
  end
end
