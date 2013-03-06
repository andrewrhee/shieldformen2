class AddOriginalPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :original_price, :decimal, precision: 8, scale: 2
  end
end
