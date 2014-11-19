class RestaurantsController < ApplicationController

before_action :authenticate_user!, except: [:index]

	def index
		@restaurants = Restaurant.all
		@review = Review.new
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new restaurant_params
		
		if @restaurant.save
			redirect_to '/restaurants'
		else
			render :new
		end
	end

	def edit
		find_restaurant
	end

	def update
		find_restaurant
		@restaurant.update restaurant_params
		redirect_to '/restaurants'
	end

	def destroy
		find_restaurant
		@restaurant.destroy

		flash[:notice] = "Successfully deleted #{@restaurant.name}"
		redirect_to '/restaurants'
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

	def find_restaurant
		@restaurant = Restaurant.find params[:id]
	end

end
