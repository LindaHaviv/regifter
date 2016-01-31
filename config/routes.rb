Rails.application.routes.draw do

  root "home#index"

  delete 'signout', to: "sessions#destroy"

  get "signup", to: "users#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  resources :carrierwave_images
  resources :users, :gifts, :categories
  resources :search
  get "/search/autocomplete/:query", to: "search#autocomplete"


end
