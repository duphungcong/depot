class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gift|jpg|png)\Z}i,
      message: 'must be a URL for GIFT, JPG or PNG image'
  }

  scope :search_title, -> (keyword) { where("title ILIKE ?", "%#{keyword}%")}

  def self.lastest
    Product.order(:updated_at).last
  end

  has_many :line_items, dependent: :restrict_with_error
  # before_destroy :ensure_not_referenced_by_any_line_item

  has_many :reviews, dependent: :destroy

  private

    # ensure that there are no line items referencing this product
    #def ensure_not_referenced_by_any_line_item
    #  if line_items.empty?
    #    true
    #  else
    #    errors.add(:base, 'Line Items present')
    #    false
    #  end
    #end
end
