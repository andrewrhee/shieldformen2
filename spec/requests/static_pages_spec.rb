require 'spec_helper'

describe "Static pages" do

	subject { page }
	
	describe "Home page" do
		before { visit root_path }

		it { should have_selector('h3', text: 'Benefits') }
		it { should have_selector 'title',
												text: full_title('Home') }
	end

	describe "Works page" do
		before { visit works_path }

		it { should have_selector('h1', text: 'How It Works') }
		it { should have_selector 'title', text: full_title('How It Works') }
	end

	describe "Trial page" do
		before { visit trial_path }

		it { should have_selector('h1', text: 'Trial') }
		it { should have_selector 'title', text: full_title('Trial') }
	end

	describe "About page" do
		before { visit about_path }

		it { should have_selector('h1', text: 'About') }
		it { should have_selector 'title', text: full_title('About Us') }
	end

	describe "Contact page" do
		before { visit contact_path }

		it { should have_selector('h1', text: 'Contact') }
		it { should have_selector 'title', text: full_title('Contact Us') }
	end
end