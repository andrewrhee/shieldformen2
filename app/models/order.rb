class Order < ActiveRecord::Base
	SHIPPING_METHOD = ["Free Shipping via USPS First Class! - FREE"]
	STATES = ["Alabama", "Alaska", "Arizona", "Arkansas", "California",
            "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
            "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
            "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts",
            "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana",
            "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico",
            "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma",
            "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", 
            "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia",
            "Washington", "West Virginia", "Wisconsin", "Wyoming"]
  CARD_TYPES = [ "Visa", "MasterCard", "Discover" ]
  CARD_EXPIRATION_MONTHS = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
  					 "11", "12" ]
  CARD_EXPIRATION_YEAR = [ "2012", "2013", "2014", "2015", "2016" ]

  has_many :line_items, dependent: :destroy

  attr_accessible :bill_to_address, :bill_to_city, :bill_to_first_name, 
  	:bill_to_last_name, :bill_to_postal_code, :bill_to_state, 
  	:customer_ip, :email, :error_message, :phone_number, :price, 
  	:ship_to_address, :ship_to_city, :ship_to_first_name, :ship_to_last_name, 
  	:ship_to_postal_code, :ship_to_state, :status

  validates :bill_to_address, :bill_to_city, :bill_to_first_name, 
  	:bill_to_last_name, :bill_to_postal_code, :bill_to_state, 
  	:customer_ip, :email, :phone_number,
  	:ship_to_address, :ship_to_city, :ship_to_first_name, :ship_to_last_name, 
  	:ship_to_postal_code, :ship_to_state,  presence: true

 	def add_line_items_from_cart(cart)
 		cart.line_items.each do |item|
 			item.cart_id = nil
 			line_items << item
 		end
 	end
end
