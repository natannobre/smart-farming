# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :devices

  root to: 'home#index'
  get '/users', to: 'home#index', as: :user

  devise_for :users

  post 'subscribe/:id', to: 'devices#subscribe_notification_to_device', as: :subscribe_device
  post 'unsubscribe/:id', to: 'devices#unsubscribe_notification_to_device', as: :unsubscribe_device
  post '/data/devices', to: 'device#handle_orion_notification', as: :device_notification
end
