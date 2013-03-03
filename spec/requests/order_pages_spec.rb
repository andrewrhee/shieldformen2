require 'spec_helper'

describe "Order pages" do

	subject { page }

	describe "new page" do

		let(:user) { FactoryGirl.create(:user) }

		describe "when cart is valid" do

			let(:product) { FactoryGirl.create(:product) }
			let(:line_item) { FactoryGirl.create(:line_item) }
			let(:cart) { FactoryGirl.create(:cart) }
			let(:submit) { "Add to cart" }

			before do
				sign_in user
				visit product_path(product)
				click_button submit
				visit new_order_path
			end

	  	it { should have_selector('h1', text: "Checkout") }
	  	it { should have_selector('title', text: "Checkout") }
		end
  	
		describe "when cart is invalid" do
			before { visit new_order_path }

			it { should have_selector('div.alert.alert-notice') }
		end

  end
end
