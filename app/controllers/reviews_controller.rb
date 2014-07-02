class ReviewsController < ApplicationController
	def new
		find_restaurant
		@review = Review.new
	end

	def create
		find_restaurant
		@review = @restaurant.reviews.create params[:review].permit(:thoughts, :rating)

		flash[:notice] = "Review Created"
		redirect_to '/restaurants'
	end

	private

	def find_restaurant
		@restaurant = Restaurant.find params[:restaurant_id]
	end

end

