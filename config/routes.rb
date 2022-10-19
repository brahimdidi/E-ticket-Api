Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :destroy] do
        resources :reservations, only: [:index, :create, :destroy]
      end
      resources :events, only: [:index, :show, :create, :update, :destroy]
    end
  end
  post "/login", to: "users#login"
  
end
