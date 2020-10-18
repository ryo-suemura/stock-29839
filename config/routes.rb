Rails.application.routes.draw do
  devise_for :users
  root to: "stocks#index"
  resources :users, only: [:edit, :update]
  resources :stocks, only: :index
end
