class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  REVIEW_SCORES = [1, 2, 3, 4, 5]
  validates :score, inclusion: REVIEW_SCORES
  validates :title, :content, presence: true

  scope :desc, -> { order(updated_at: :desc) }
end
