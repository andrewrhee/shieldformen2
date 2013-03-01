class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :phone_number
      t.string :bill_to_first_name
      t.string :bill_to_last_name
      t.string :bill_to_address
      t.string :bill_to_city
      t.string :bill_to_state
      t.string :bill_to_postal_code
      t.string :ship_to_first_name
      t.string :ship_to_last_name
      t.string :ship_to_address
      t.string :ship_to_city
      t.string :ship_to_state
      t.string :ship_to_postal_code
      t.string :customer_ip
      t.string :status
      t.string :error_message
      t.decimal :price

      t.timestamps
    end
  end
end
