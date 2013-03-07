module ProductsHelper

	def rating_ballot
		if @rating = current_user.ratings.find_by_product_id(params[:id])
			@rating
		else
			current_user.ratings.new
		end
	end

	def all_rating
		@rating
	end

	def render_stars(rating)
		(0..5).map do |position|
			image_tag begin
				if rating >= position + 1
					"star-bright.png"
				else rating <= position
					"star-dim.png"
				end
			end
		end.join
	end

	def current_user_rating
		if @rating = current_user.ratings.find_by_product_id(params[:id])
			@rating.value
		else
			"N/A"
		end
	end

end
