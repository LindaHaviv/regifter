Rails.application.routes.draw do

  get 'gift_swaps/index'

  get 'gift_swaps/new'

  get 'gift_swaps/create'

  root "gifts#index"

  delete 'signout', to: "sessions#destroy"

  get "signup", to: "users#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  resources :users, :gifts, :categories
  resources :gift_swaps

  resources :conversations do
    resources :messages
   end
end
