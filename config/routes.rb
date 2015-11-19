Rails.application.routes.draw do
  root 'links#index'

  resources :users, only: [:new, :create]
  resources :links, except: [:show, :destroy]
  resources :tags, only: [:create]
  get 'link/:id/untag/:tag_id', to: 'links#untag', as: "untag"

  get     '/login',  to: "sessions#new"
  post    '/login',  to: "sessions#create"
  delete  '/logout', to: "sessions#destroy", as: "logout"
end
