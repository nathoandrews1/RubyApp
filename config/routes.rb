Rails.application.routes.draw do
  get 'cars/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "homepage#index"
  resources :cars do
    resources :reviews
  end

  # Defines the root path route ("/")
end
