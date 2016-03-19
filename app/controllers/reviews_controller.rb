class ReviewsController < ApplicationController
  before_action :authorize_member, only: [:new, :create, :edit, :update, :destroy, :review_by_user]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # list reviews by user
  def review_by_user
    @reviews = Review.where(user_id: current_user.id)
  end

  def show
  end

  def new
    product = Product.find(params[:product_id])
    @review = product.reviews.new
  end

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.build(review_params.merge(user: current_user))
    if @review.save
      redirect_to @review.product, notice: 'Thanks to review this book'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to product_review_path(@review.product, @review) , notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to review_by_user_path, notice: 'Your review was successfully deleted.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :score)
    end
end
