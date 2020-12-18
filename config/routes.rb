Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
  post 'users/:id' => 'books#show'
  get 'home/about' => 'homes#show'
  patch '/books' => 'books#index'
end
