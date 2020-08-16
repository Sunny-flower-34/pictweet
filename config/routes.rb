Rails.application.routes.draw do
  devise_for :users
  # devise_forは、ユーザー機能に必要なルーティングを一気に生成してくれるdeviseのメソッド 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'

  #ネスト・「コメントを投稿する」機能、つまり「コメント情報を作る機能」を実装するのでcreateアクションのルーティング
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  # ７つのアクションを自動生成　resourcesメソッド
  resources :users, only: :show
end
