class RestaurantsController < ApplicationController

    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        #check if restaurant is present
        restaurant = Restaurant.find_by(id:params[:id])
        #return restaurant 
        if restaurant
            render json:
            restaurant, only:[:id, :name, :address], include: :pizzas
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end

    def destroy
        restaurant = Restaurant.find_by(id:params[:id])
        if restaurant
            restaurant.destroy
            head :no_content
        else
            render json: {error: "Restaurant not found"},
            status: :not_found
        end
    end
end
