require 'spec_helper'

describe Order do

	before do
  	@order = Order.new(
  		email: "example@example.com",
      phone_number: "1234567890",
      bill_to_first_name: "First",
      bill_to_last_name: "Last",
      bill_to_address: "123 Test St.",
      bill_to_city: "City",
      bill_to_state: "State",
      bill_to_postal_code: "000000",
      ship_to_first_name: "First",
      ship_to_last_name: "Last",
      ship_to_address: "123 Test St.",
      ship_to_city: "City",
      ship_to_state: "State",
      ship_to_postal_code: "000000",
      customer_ip: "123.123.123.123",
      status: "success",
      error_message: "nil",
      price: "9.99")
  end

  subject { @order }

  it { should respond_to(:email) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:bill_to_first_name) }
  it { should respond_to(:bill_to_last_name) }
  it { should respond_to(:bill_to_address) }
  it { should respond_to(:bill_to_city) }
  it { should respond_to(:bill_to_state) }
  it { should respond_to(:bill_to_postal_code) }
  it { should respond_to(:ship_to_first_name) }
  it { should respond_to(:ship_to_last_name) }
  it { should respond_to(:ship_to_address) }
  it { should respond_to(:ship_to_city) }
  it { should respond_to(:ship_to_state) }
  it { should respond_to(:ship_to_postal_code) }
  it { should respond_to(:customer_ip) }
  it { should respond_to(:status) }
  it { should respond_to(:error_message) }
  it { should respond_to(:price) }

  it { should be_valid }



end
