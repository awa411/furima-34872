Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_addresses', to: 'users/registrations#new_user_address'
    post 'user_addresses', to: 'users/registrations#create_user_address'
  end
  root to: "items#index"
  get 'items/items_search'
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items do
    resources "orders", only: [:index, :create]
    resources "messages", only: :create
    collection do
      get 'search'
    end
  end
end
