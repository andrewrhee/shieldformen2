class AddDiscountIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :discount_id, :integer
  end
end
