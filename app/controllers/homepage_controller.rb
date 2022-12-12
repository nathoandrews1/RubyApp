# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @car = Car.all
  end
end
