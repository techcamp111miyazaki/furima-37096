Rails.application.routes.draw do
  get 'users/show'
  get 'items/searching'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :comments, only: :create
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
    member do
      get 'search_id'
    end
  end
  resources :users, only: [:show, :update]
end
