Rails.application.routes.draw do
  devise_for :users

  root 'top#index'
  resources :users, only: [:show, :update]
  resources :items, only: [:show, :index] do
    collection do
      get 'search'
      #collectionはRails7つのアクション以外のアクション名を定義する時に使う
    end
  end
  resources :category, only: [:show, :index]
  get 'buy/:id' => "buy#new" # 購入ページの表示
  post 'buy/:id/completed' => "buy#create" # purchaseHistoryテーブルを更新して購入完了ページへ遷移

end
