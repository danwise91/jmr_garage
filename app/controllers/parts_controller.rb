class PartsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]

  def index
    @parts = Part.all
    @categories = Category.all
    @order_item = current_order.order_items.new
    @parts = @parts.search(params[:search]) if params[:search].present?
  end

  def new
    @part = Part.new
  end

  def show
    @part = Part.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def create
    @part = Part.new(part_params)
      if @part.save
        redirect_to part_path(@part)
  end
end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
      if @part.update_attributes(part_params)
        redirect_to @part
      end
    end

    def destroy
      @part = Part.find(params[:id])
      @part.destroy
        redirect_to parts_path
    end

  private
  def part_params
    params.require(:part).permit(:description, :name, :price, :active, :image, :remove_image, :discount, :category_id)
  end

end
