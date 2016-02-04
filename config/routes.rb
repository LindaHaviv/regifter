Rails.application.routes.draw do
  root "gifts#index"

  delete 'signout', to: "sessions#destroy"

  get "signup", to: "users#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  resources :users, :categories, :search, :gifts, :requests, :swaps

  resources :gifts do
    resources :requests
  end

  resources :conversations do
    resources :messages
  end
  post 'gifts/accept/:id', to: 'gifts#accept', as: 'accept'
end
