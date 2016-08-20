Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :update]
  resources :items, only: [:show, :index] do
    collection do
      get 'search'
      #collectionはRails7つのアクション以外のアクション名を定義する時に使う
    end
  end
  resources :category, only: [:show, :index]

end
