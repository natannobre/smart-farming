# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :devices

  root to: 'home#index'
  get '/users', to: 'home#index', as: :user

  devise_for :users

  post '/data/devices', to: 'device#handle_orion_notification', as: :device_notification
end
