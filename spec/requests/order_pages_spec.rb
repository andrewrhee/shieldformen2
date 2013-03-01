require 'spec_helper'

describe "Order pages" do

	subject { page }

	describe "new page" do

		describe "when cart is valid" do

			before { visit new_order_path }

	  	it { should have_selector('h1', text: "Checkout") }
	  	it { should have_selector('title', text: "Checkout") }
		end
  	
		describe "when cart is invalid" do
			before { visit new_order_path }

			it { should have_selector('div.alert.alert-notice') }
		end

  end
end
