class Session < ActiveRecord::Base
	attr_accessible :email, :password
	has_many :orders

end