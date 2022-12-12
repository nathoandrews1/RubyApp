# frozen_string_literal: true

class Review < ApplicationRecord
  include Visible
  belongs_to :car
  belongs_to :user
end
