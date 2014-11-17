class ReviewsController < ApplicationController
	def new
		find_restaurant
		@review = Review.new
	end

	def create
		find_restaurant
		@review = @restaurant.reviews.create params[:review].permit(:thoughts, :rating)	
		redirect_to '/restaurants' unless request.xhr?
	end

	private

	def find_restaurant
		@restaurant = Restaurant.find params[:restaurant_id]
	end
end

