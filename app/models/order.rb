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

  belongs_to :plans
  belongs_to :users
  belongs_to :sessions
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :sessions

  attr_accessible :bill_to_address, :bill_to_city, :bill_to_first_name, 
  	:bill_to_last_name, :bill_to_postal_code, :bill_to_state, 
  	:customer_ip, :email, :error_message, :phone_number, :price, 
  	:ship_to_address, :ship_to_city, :ship_to_first_name, :ship_to_last_name, 
  	:ship_to_postal_code, :ship_to_state, :status, :stripe_card_token, :plan_id,
    :user_id, :session, :users_attributes, :sessions_attributes

  attr_accessor :stripe_card_token

  validates :bill_to_address, :bill_to_city, :bill_to_first_name, 
  	:bill_to_last_name, :bill_to_postal_code, :bill_to_state, 
  	:customer_ip, :email, :phone_number,
  	:ship_to_address, :ship_to_city, :ship_to_first_name, :ship_to_last_name, 
  	:ship_to_postal_code, :ship_to_state, :plan_id,  presence: true

  default_scope order: 'orders.created_at DESC'

 	def add_line_items_from_cart(cart)
 		cart.line_items.each do |item|
 			item.cart_id = nil
 			line_items << item
 		end
 	end

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
