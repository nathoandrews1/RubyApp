class HomepageController < ApplicationController
  def index
    @car = Car.all;
  end
end
