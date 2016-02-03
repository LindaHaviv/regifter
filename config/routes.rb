Rails.application.routes.draw do
  root "home#index"

  delete 'signout', to: "sessions#destroy"

  get "signup", to: "users#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  resources :users, :categories, :search, :gifts, :requests

  resources :gifts do
    resources :requests
  end
  # get "/search/autocomplete/:query", to: "search#autocomplete"

  resources :conversations do
    resources :messages
  end
end
