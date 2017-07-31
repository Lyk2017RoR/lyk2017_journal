Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
