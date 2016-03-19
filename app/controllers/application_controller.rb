class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_cart

  protected

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in
      current_user != nil
    end

    def current_cart
      @current_cart ||= Cart.find_by(id: session[:cart_id])
      if @current_cart.nil?
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
      @current_cart
    end

    def authorize_member
      unless logged_in
        redirect_to login_url, notice: 'Please log in'
      end
    end

    def authorize_admin
      unless logged_in && current_user.admin?
        redirect_to login_url, notice: 'Please log in as admin'
      end
    end
  
end
