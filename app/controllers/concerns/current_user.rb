module CurrentUser
  extend ActiveSupport::Concern

  private

    def get_current_user
      @current_user = User.find_by_id(session[:user_id])
    end
end