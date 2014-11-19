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
		@restaurant.user = current_user
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
		@restaurant = current_user.restaurants.find params[:id]
		@restaurant.destroy

		flash[:notice] = "Successfully deleted #{@restaurant.name}"
		rescue ActiveRecord::RecordNotFound
			Rails.logger.warn('WARNING: A user tried to delete a restaurant')
			flash[:notice] = 'You do not have permission to Delete Restaurant'
		ensure
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
