class Discount < ActiveRecord::Base
  attr_accessible :discount_code, :discount_factor

  has_many :line_items
  has_many :carts, through: :line_items
  has_many :orders, through: :line_items

  validates :discount_factor, numericality: {greater_than_or_equal_to: 0.01, less_than: 1.00}
end
