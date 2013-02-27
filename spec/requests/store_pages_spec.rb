require 'spec_helper'

describe "Store pages" do
	subject { page }

	describe "index page" do
  	before { visit store_path }

  	it { should have_selector('h1', text: "Store") }
  	it { should have_selector('title', text: "Store") }
  end
end
