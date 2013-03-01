require 'spec_helper'

describe "Cart pages" do

	subject { page }

	describe "show page" do
		let(:cart) { FactoryGirl.create(:cart) }
  	before { visit cart_path(cart) }

  	it { should have_selector('h1', text: "Shopping Cart") }
  	it { should have_selector('title', text: "Shopping Cart") }
  end

end
