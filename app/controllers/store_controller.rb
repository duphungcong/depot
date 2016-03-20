class StoreController < ApplicationController
  def index
    @products = Product.where(nil) # creates an anonymos scope
    @products = @products.search_title(params[:search]) if params[:search]
  end
end
