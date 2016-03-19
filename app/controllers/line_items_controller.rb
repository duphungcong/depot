class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # POST /line_items
  def create
    product = Product.find(params[:product_id])
    @line_item = current_cart.add_product(product.id)
    if @line_item.save
      redirect_to @line_item.cart, notice: 'Your book was successfully added to cart.'
    else
      render :new
    end
  end

  # PATCH/PUT /line_items/1
  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
    redirect_to line_items_url, notice: 'Line item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
