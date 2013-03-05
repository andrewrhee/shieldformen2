class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	belongs_to :cart
	belongs_to :discount
  attr_accessible :cart_id, :product_id, :discount_id

  def total_price
  	product.price * quantity
  end

end
