Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # 下記のresorcesの中に[:edit(編集機能実装の手順1), :update(編集機能実装の手順5), destroy(削除機能実装の手順1)]を実装機能ごとに追加
  resources :items, only: [:index, :new, :create, :show]
end