# frozen_string_literal: true

Rails.application.routes.draw do
  get 'about_us/about_us'
  get 'cars/index'
  get 'admin_panel/admin_panel'
  get '/reviews', to: 'reviews#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'homepage#index'
  resources :cars do
    resources :reviews
  end
end
