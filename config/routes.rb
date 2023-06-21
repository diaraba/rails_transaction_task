Rails.application.routes.draw do
  root 'items#index'
  resources :orders, only: [:index, :new, :create]
  resources :items, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  namespace :admin do
    resources :users, only: [:new, :create]
  end
end
