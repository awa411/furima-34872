Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :users
  root to: "items#index"
  get 'items/items_search'
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items do
    resources "orders", only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
