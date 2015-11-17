Rails.application.routes.draw do
  root 'static_pages#home'
  get 'login'  =>  'sessions#new'
  post  'login'  =>  'sessions#create'
  delete 'logout'  =>  'sessions#destroy'
  get 'signup'  =>  'users#new'
  resources :users
  resources :categories,only: [:index]
  resources :lessons, only: [:show, :create, :update, :index]
  resources :words,only: [:index]
  resources :results
  resources :follows, only: [:update, :destroy]
  resources :activities

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :categories,only: [:new, :create, :edit, :update, :destroy, :index]
    resources :words,only: [:new, :create, :edit, :update, :destroy, :index]
  end
end
