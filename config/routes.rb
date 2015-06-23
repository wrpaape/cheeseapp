Rails.application.routes.draw do

  resources :cheeses
  resources :users
  resources :users, :cheeses

  get  'login', to: 'sessions#new',    as: 'login'
  post 'login', to: 'sessions#create', as: 'create_session'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'cheeses#index'
end
