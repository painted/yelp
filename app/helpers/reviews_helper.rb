module ReviewsHelper
	def star_rating(rating)
		return rating unless rating.respond_to?(:round)

		rounded_rating = rating.round
		remainder = (5 - rounded_rating)
		# half_star = (5 - rounded_rating - remainder) floor and ceil
		("★" * rounded_rating) + ('☆' * remainder)
	end
end
