FactoryGirl.define do
	factory :user do
		name     "Andrew Rhee"
		email    "adrhee@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end