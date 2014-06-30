class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		Restaurant.create restaurant_params
		redirect_to '/restaurants'
	end

	def edit
		find_restaurant
	end

	def update
		find_restaurant
		@restaurant.update restaurant_params
		redirect_to '/restaurants'
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name)
	end

	def find_restaurant
		@restaurant = Restaurant.find params[:id]
	end

end
