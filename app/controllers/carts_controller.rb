class CartsController < ApplicationController
  before_action :authorize_admin, except: [:show, :destroy]
  before_action :set_cart, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts/1
  def show
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to store_url, notice: 'Cart was successfully emptyed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid cart'
    end
end
