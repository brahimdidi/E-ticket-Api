Rails.application.routes.draw do
  post 'api/v1/register/:username, to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'
  get 'api/v1/users/event/:id', to: 'users#user_event'
  get 'splash', to: 'users#register'
  get 'users/:id', to: 'users#index'
  namespace :api do
    namespace :v1 do
      get 'reservations/:user_id', to: 'reservations#index'
      post 'reservations/:user_id', to: 'reservations#create'
      get 'api/v1/event/:id', to: 'eventss#show'
      delete 'api/v1/events/:id', to: 'events#delete'
      resources :events, only: %i[index show create destroy] 
      resources :users do
        resources :reservations, only: %i[index show]
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
