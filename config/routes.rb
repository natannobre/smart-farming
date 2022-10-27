# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :devices
  resources :sensors, controller: 'devices', type: 'Sensor'

  root to: 'home#index'
  get '/users', to: 'home#index', as: :user
  get 'generate_csv', to: 'home#generate_csv', as: :generate_csv

  post '/subscribe/:id', to: 'devices#subscribe_notification_to_device', as: :subscribe_device
  post '/unsubscribe/:id', to: 'devices#unsubscribe_notification_to_device', as: :unsubscribe_device

  post '/devices/data_notifications', to: 'notifications#handle_orion_notification', as: :device_notification
end
