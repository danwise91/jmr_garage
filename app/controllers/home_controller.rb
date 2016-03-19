class HomeController < ApplicationController
  def index
    @categories = Category.all
    @parts = Part.all
    @parts = @parts.search(params[:search]) if params[:search].present?
  end


end
