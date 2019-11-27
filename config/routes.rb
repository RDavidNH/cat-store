Rails.application.routes.draw do

  get 'items/index'
  get 'items/create'
  get 'items/update'
  get 'items/delete'
  get 'items/new'
  get 'items/show'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :carts
  resources :users, only: [:show]
  root "items#index"
end
