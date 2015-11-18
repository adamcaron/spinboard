Rails.application.routes.draw do
  root 'links#index'

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :new, :create, :update]

  get     '/login',           to: "sessions#new"
  post    '/login',           to: "sessions#create"
  delete  '/logout',          to: "sessions#destroy", as: "logout"
end
