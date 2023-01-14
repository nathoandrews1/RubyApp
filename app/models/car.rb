# frozen_string_literal: true

class Car < ApplicationRecord
  include Visible

  has_many :reviews, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :engine, presence: true
  validates :mpg, presence: true
  validates :price, presence: true
  validates :horsepower, presence: true
end
