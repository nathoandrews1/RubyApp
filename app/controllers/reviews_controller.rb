# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reviews = Review.all
  end

  def create
    @car = Car.find(params[:car_id])
    @review = @car.reviews.create(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to car_path(@car)
  end

  def show
    @car = Car.find(params[:car_id])
    @review = @car.reviews.find(params[:id])
    @review.destroy
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:car_id])
    @review = @car.reviews.find(params[:id])
    @review.destroy
    redirect_to car_path(@car)
  end

  private

  def review_params
    params.require(:review).permit(:username, :reviewbody, :status, :user_id, :rating)
  end
end
