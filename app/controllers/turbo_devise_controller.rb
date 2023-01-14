# frozen_string_literal: true

class TurboDeviseController < ApplicationController
  # Respond to the turbo stream
  @user = User.all
  @review = Review.all
  @car = Car.all
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => e
      if get?
        raise e
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location, allow_other_host: true
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
