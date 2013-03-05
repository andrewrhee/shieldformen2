class Discount < ActiveRecord::Base
  attr_accessible :discount_code

  has_many :line_items
  has_many :carts, through: :line_items
  has_many :orders, through: :line_items
end
