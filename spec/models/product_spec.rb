require 'spec_helper'

describe Product do
  
  before do
  	@product = Product.new(title: "Lorem Ipsum",
  												 description: "Wibbles are fun!",
  												 image_url: "lorem.jpg",
  												 price: "19.95")
  end

  subject { @product }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:image_url) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "when title is not present" do
		before { @product.title = " "  }
		it { should_not be_valid }
  end

	describe "when description is not present" do
		before { @product.description = " "  }
		it { should_not be_valid }
  end

  describe "when image_url is not present" do
		before { @product.image_url = " "  }
		it { should_not be_valid }
  end

  describe "when price is not present" do
		before { @product.price = " "  }
		it { should_not be_valid }
  end

  describe "when price is less than 0.01" do
  	before { @product.price = "0.001" }
  	it { should_not be_valid }
  end

  describe "when price is invalid" do
  	before { @product.price = "-1" }
  	it { should_not be_valid }
  end

  describe "when price is valid" do
  	before { @product.price = "1" }
  	it { should be_valid }
  end

  describe "when image_url is valid" do
  	it "should be valid" do
  		ok = %w[fred.gif fred.jpg FREd.JPG FRED.Jpg fred.png
  						http://a.b.c./x/y/z/fred.gif]
  		bad = %w[fred.doc fred.gif/more fred.gif.more ]
  		ok.each do |valid|
  			@product.image_url = valid
  			@product.should be_valid
  		end
  		bad.each do |invalid|
  			@product.image_url = invalid
  			@product.should_not be_valid
  		end
  	end
  end
end
