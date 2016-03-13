module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_current_cart
      @current_cart = Cart.find_by_id(session[:cart_id])
      unless @current_cart
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
end