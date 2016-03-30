class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]


  def create
    part = Part.find(params[:part_id])
    @line_item = @cart.add_part(part.id)

    respond_to do |format|
       if @line_item.save
         format.html { redirect_to parts_path }
         format.js 
         format.json { render action: 'show', status: :created,
          location: @line_item }
        else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors,
        status: :unprocessable_entity }
      end
    end


  end
end
