Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
end
