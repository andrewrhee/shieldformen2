Product.delete_all
Product.create(title: 'Acne Buster - Treatment Lotion',
	description:
		%{<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
				do eiusmod tempor incididunt ut labore et dolore magna aliqua.
				 Ut enim ad minim veniam, quis nostrud exercitation ullamco 
				 laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
				 irure dolor in reprehenderit in voluptate velit esse cillum 
				 dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
				 cupidatat non proident, sunt in culpa qui officia deserunt 
				 mollit anim id est laborum.
			</p>},
		image_url: 'image.jpg',
		price: 29.00)
# . . .
Product.create(title: 'Acne Buster - Treatment Cleanser',
  description:
    %{<p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
				do eiusmod tempor incididunt ut labore et dolore magna aliqua.
				 Ut enim ad minim veniam, quis nostrud exercitation ullamco 
				 laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
				 irure dolor in reprehenderit in voluptate velit esse cillum 
				 dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
				 cupidatat non proident, sunt in culpa qui officia deserunt 
				 mollit anim id est laborum.
      </p>},
  image_url: 'image.jpg',
  price: 19.00)