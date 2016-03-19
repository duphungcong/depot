class OrdersController < ApplicationController
  before_action :authorize_admin, only: [:index, :edit, :update]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    if current_cart.line_items.empty?
      redirect_to current_cart, notice: 'Your cart is empty'
    end
    if current_user
      @order = Order.new(name: current_user.name)
    else
      @order = Order.new
    end

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to @order, notice: 'Thank you for your order!'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
