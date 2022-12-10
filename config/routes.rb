Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "cars#index"
  resources :cars do
    resources :reviews
  end
  # Defines the root path route ("/")
end
