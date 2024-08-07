class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
    @review = @restaurant.reviews.build
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @restaurant.update!(params_restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
