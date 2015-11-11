Rails.application.routes.draw do
  get 'categories/new'

  root 'static_pages#home'
  get 'login'  =>  'sessions#new'
  post  'login'  =>  'sessions#create'
  delete 'logout'  =>  'sessions#destroy'
  get 'signup'  =>  'users#new'
  resources :users
  resources :categories,only: [:index]
  resources :follows, only: [:update, :destroy]
  namespace :admin do
    resources :categories,only: [:new, :create, :edit, :update, :destroy]
    resources :users, except: [:new, :create]
  end
end
