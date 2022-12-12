# frozen_string_literal: true

# Home page controller
class HomepageController < ApplicationController
  def index
    @car = Car.all
  end
end
