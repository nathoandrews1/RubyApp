class Review < ApplicationRecord
  include Visible
  belongs_to :car
end
