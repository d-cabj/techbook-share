Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :update]
  resources :items, only: [:show]
  resources :category, only: [:show, :index]

end
