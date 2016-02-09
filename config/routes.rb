Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  root "home#index"

  get 'contact', to: "home#contact"

  get 'signout', to: "sessions#destroy"

  get "signup", to: "users#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  get "auth", to: "users#auth", as: "auth"
  resources :users, :categories, :search, :gifts, :requests, :swaps


  resources :gifts do
    resources :requests
  end

  resources :conversations do
    resources :messages
  end
  post 'gifts/accept/:id', to: 'gifts#accept', as: 'accept'

  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"
end
