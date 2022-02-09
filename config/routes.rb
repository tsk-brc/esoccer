# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'top#index'

  resources :results do
    get 'search', on: :collection
  end

  resources :players, only: :index
  resources :players, only: :show, param: :player1_name
end
