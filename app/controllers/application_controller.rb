class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CurrentCart, CurrentUser
  before_action :set_current_cart, :get_current_user

  protected

    def authorize_member
      unless @current_user
        redirect_to login_url, notice: 'Please log in'
      end
    end

    def authorize_admin
      unless @current_user && @current_user.admin?
        redirect_to login_url, notice: 'Please log in as admin'
      end
      #if @current_user.nil? or @current_user.admin? == false
      #  redirect_to login_url, notice: 'Please log in as admin'
      #end
    end
  
end
