Rails.application.routes.draw do
  root "welcome#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
