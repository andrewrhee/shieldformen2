class AddDiscountFactorToDiscount < ActiveRecord::Migration
  def change
    add_column :discounts, :discount_factor, :decimal, precision: 8, scale: 2
  end
end
