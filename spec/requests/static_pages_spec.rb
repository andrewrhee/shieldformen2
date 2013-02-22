require 'spec_helper'

describe "Static pages" do
	
	describe "Home page" do
		it "should have the h3 'Benefits'" do
			visit '/static_pages/home'
			page.should have_selector('h3', text: 'Benefits')
		end

		it "should have the title" do
			visit '/static_pages/home'
			page.should have_selector('title',
												text: 'Home | Shield For Men')
		end
	end

	describe "Works page" do
		it "should have the h1 'How It Works'" do
			visit '/static_pages/works'
			page.should have_selector('h1', text: 'How It Works')
		end

		it "should have the title 'How It Works'" do
			visit '/static_pages/works'
			page.should have_selector('title', text: 'How It Works | Shield For Men')
		end
	end

	describe "Trial page" do
		it "should have the h1 'Trial'" do
			visit '/static_pages/trial'
			page.should have_selector('h1', text: 'Trial')
		end

		it "should have the title 'Trial'" do
			visit '/static_pages/trial'
			page.should have_selector('title', text: 'Trial | Shield For Men')
		end
	end

	describe "About page" do
		it "should have the h1 'About'" do
			visit '/static_pages/about'
			page.should have_selector('h1', text: 'About')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			page.should have_selector('title', text: 'About Us | Shield For Men')
		end
	end

	describe "Contact page" do
		it "should have the h1 'Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', text: 'Contact')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('title', text: 'Contact | Shield For Men')
		end
	end
end