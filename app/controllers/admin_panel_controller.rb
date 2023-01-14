# frozen_string_literal: true
class AdminPanelController < ApplicationController
  def admin_panel
    @car = Car.all
    $user_current = current_user
  end
end
