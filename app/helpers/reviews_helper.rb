module ReviewsHelper
  def form_submit_url(review)
    review.new_record? ? product_reviews_path : product_review_path
  end
end
