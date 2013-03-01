FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end
	factory :product do
		title 'Lorem Ipsum'
		description 'Wibbles are fun!'
		image_url "lorem.jpg"
		price "19.95"
	end
	factory :line_item do
		quantity { Random.rand(1..5) }
		product
	end
	factory :cart do
		factory :cart_with_two_line_items do
			ignore do
				line_item_count 2
			end

			after(:create) do |cart, evaluator| 
				FactoryGirl.create_list(:line_item, evaluator.line_item_count, cart_id: cart)
			end
		end	
	end
	factory :order do
		email "example@example.com"
    phone_number "1234567890"
    bill_to_first_name "First"
    bill_to_last_name "Last"
    bill_to_address "123 Test St."
    bill_to_city "City"
    bill_to_state "State"
    bill_to_postal_code "000000"
    ship_to_first_name "First"
    ship_to_last_name "Last"
    ship_to_address "123 Test St."
    ship_to_city "City"
    ship_to_state "State"
    ship_to_postal_code "000000"
    customer_ip "123.123.123.123"
    status "success"
    error_message " "
    price "9.99"
	end
end