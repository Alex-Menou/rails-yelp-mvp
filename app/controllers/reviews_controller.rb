class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]

  def new
    @review = @restaurant.reviews.new
  end

  def create
    @review = @restaurant.reviews.new(params_review)
    if @review.save!
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private
  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_review
    params.require(:review).permit(:rating, :content)
  end

end
