class ReviewsController < ApplicationController
  before_action :authorize_member, only: [:new, :create, :edit, :update, :destroy, :review_by_user]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # list reviews by user
  def review_by_user
    @reviews = Review.where(user_id: @current_user.id)
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.build(user: @current_user)
    @review.title = review_params[:title]
    @review.content = review_params[:content]
    @review.score = review_params[:score]

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.product, notice: 'Thanks to review this book' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to product_review_path(@review.product, @review) , notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to review_by_user_path, notice: 'Your review was successfully deleted.'}
    end
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
