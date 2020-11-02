Rails.application.routes.draw do
  devise_for :users
  root to: "stocks#index"
  resources :users, only: [:edit, :update]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :stocks, only: [:index, :new, :create, :edit] do
    resources :purchases, only: [:new, :create]
    resources :orders, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  get 'orders', to: 'orders#index'
end
