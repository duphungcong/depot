class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def sub_total_price
    product.price * quantity
  end
end
