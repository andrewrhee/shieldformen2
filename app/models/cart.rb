class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  has_many :discounts, through: :line_items

  accepts_nested_attributes_for :discounts

  attr_accessible :discounts_attributes


  def decrement_line_item_quantity(line_item_id)
    current_item = line_items.find(line_item_id)

    if current_item.quantity > 1
      current_item.quantity -= 1
    else
      current_item.destroy
    end

    current_item
  end

  def increment_line_item_quantity(line_item_id)
    current_item = line_items.find(line_item_id)
    current_item.quantity += 1
    current_item
  end

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def add_product_with_code(product_id, discount_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.discount_id = discount_id
    else
      current_item = line_items.build(product_id: product_id, discount_id: discount_id)
    end
    current_item
  end

  def quantity
    line_items.to_a.sum { |item| item.quantity }
  end


 
  def find_discount_factor(discount_code)
    discount = Discount.find_by_discount_code(discount_code)
    discount_factor = discount.discount_factor
  end

  def discount_price(discount_factor)
    discount_price = total_price - (total_price * discount_factor)
    discount_price
  end


  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  
  
end
