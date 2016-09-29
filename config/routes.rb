Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,  controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations"
    }

  root 'top#index'
  resources :users, only: [:show, :update]
  resources :items, only: [:show, :index] do
    collection do
      get 'search'
      #collectionはRails7つのアクション以外のアクション名を定義する時に使う
    end
    resources :likes, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end
  # resources :category, only: [:show, :index] →items/searchでcategory/showを代用したため削除。カテゴリー一覧ページ(category/index)も不必要と判断したため削除。
  get 'buy/:id' => "buy#new" # 購入ページの表示
  post 'buy/:id/completed' => "buy#create" # purchaseHistoryテーブルを更新して購入完了ページへ遷移

end
