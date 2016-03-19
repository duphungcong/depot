class UsersController < ApplicationController
  before_action :authorize_admin, only: [:index, :destroy]
  before_action :authorize_member, only: [:show, :edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    if current_user
      redirect_to users_url, notice: 'Sorry, you must log out first'
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User #{ @user.name } was successfully created"
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User #{ @user.name } was successfully updated"
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    unless @user.admin?
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else
      redirect_to users_url, notice: 'Can not delete admin user.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
