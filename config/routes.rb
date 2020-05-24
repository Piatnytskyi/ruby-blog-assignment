Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'posts', to: 'pages#index'
  get 'about', to: 'pages#about'
  resources :posts
end
