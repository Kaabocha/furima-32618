Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # 下記のresorcesの中に:destroy(削除機能実装の手順1)]を実装機能ごとに追加
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end