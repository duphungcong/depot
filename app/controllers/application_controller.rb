class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CurrentCart, CurrentUser
  before_action :set_current_cart, :get_current_user

  protected

    def authorize_member
      if @current_user.nil?
        redirect_to login_url, notice: 'Please log in'
      end
    end

    def authorize_admin
      if @current_user.nil? or @current_user.is_admin == false
        redirect_to login_url, notice: 'Please log in as admin'
      end
    end
  
end
