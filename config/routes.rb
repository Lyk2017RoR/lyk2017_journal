Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
end
