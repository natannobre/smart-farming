Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
  get '/users', to: 'home#index', as: :user

  devise_for :users

  post '/data/sensors', to: 'sensor#handle_orion_notification', as: :device_notification
end
