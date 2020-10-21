Rails.application.routes.draw do
  devise_for :users
  root to: "stocks#index"
  resources :users, only: [:edit, :update]
  resources :stocks, only: [:index, :new, :create] do
    resources :purchases, only: [:new, :create]
    resources :orders, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
