Rails.application.routes.draw do
  root 'links#index'

  resources :users, only: [:new, :create]
  resources :links, except: [:show, :destroy]

  get     '/login',  to: "sessions#new"
  post    '/login',  to: "sessions#create"
  delete  '/logout', to: "sessions#destroy", as: "logout"
end
