class ReviewsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def create
    @car = Car.find(params[:car_id])
    @review = @car.reviews.create(review_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:car_id])
    @review = @car.reviews.find(params[:id])
    @review.destroy
    redirect_to car_path(@car), status: :see_other
  end

  private
  def review_params
    params.require(:review).permit(:username, :reviewbody, :status)
  end
end
