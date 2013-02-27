require 'spec_helper'

describe "Product pages" do

	

  subject { page }

  describe "index page" do
  	before { visit products_path }

  	it { should have_selector('h1', text: "All products") }
  	it { should have_selector('title', text: "All products") }
  end

  describe "new page" do
  	before { visit new_product_path }

  	it { should have_selector('h1', text: "New product") }
  	it { should have_selector('title', text: "New product") }

    describe "with valid information" do
      before { visit new_product_path }

      before do
        fill_in "Title",       with: "Lorem Ipsum"
        fill_in "Description", with: "Wibbles are fun!"
        fill_in "Image url",   with: "lorem.jpg"
        fill_in "Price",       with: "19.95"
      end

      it "should create a new product" do
        expect { click_button "Save" }.to change(Product, :count).by(1)
      end
    end
  end

  describe "edit page" do
    let(:product) { FactoryGirl.create(:product) }
    before { visit edit_product_path(product) }

    describe "page" do
      it { should have_selector('h1', text: "Editing product")  }
      it { should have_selector('title', text: "Editing product") }
    end

    describe "with invalid information" do
      before do 
        fill_in "Title",        with: " "
        fill_in "Description",  with: " "
        fill_in "Image url",    with: " "
        fill_in "Price",        with: " "
        click_button "Save"
      end

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_title) { "New Title" }
      let(:new_description) { "Wibbles are extremely fun!" }

      before do
        fill_in "Title",             with: new_title
        fill_in "Description",       with: new_description
        fill_in "Image url",         with: product.image_url
        fill_in "Price",             with: product.price
        click_button "Save"
      end

      it { should have_selector('title', text: "Showing product") }
      it { should have_selector('div.alert.alert-notice') }
    end

  end

end
