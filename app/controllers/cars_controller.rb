# frozen_string_literal: true
require 'curse_word_killer'

class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @car = Car.all
    $user_current = current_user
  end

  def show
    @car = Car.find(params[:id])
    @reviews = @car.reviews
    @reviews.each do |review|
      review.reviewbody = CurseWordKiller.filter(review.reviewbody)
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to new_car_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to request.path, status: :see_other;
  end

  def filter_profanity(text)
    @profanity = text.split(' ')
    @profanityList = %w[fuck fuck. fucking fucking. cunt cunt. bitch bitch. bastard arse arsehole ass asshole bullshit bollocks bollox crap prick shit twat]
    @filtered = []
    @profanity.each do |word|
      if word.downcase
        if word.in?(@profanityList)
          @word = word[0] #Setting the first letter here
          @index = 0

          #looping the elements of the curse word
          word.split("").each do |char|
            if @index == word.size - 1
              @word += char
              break
            end
            @word += '*'
            @index += 1;
          end
          #adding the filtered word to the array
          @filtered << @word
        else
          #adding non profanity word back to array
          @filtered << word
        end
      end
    end
    @sentence = @filtered.join(' ')
    return @sentence
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :engine, :mpg, :price, :status, :horsepower)
  end
end
