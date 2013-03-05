class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :discount_code

      t.timestamps
    end
  end
end
