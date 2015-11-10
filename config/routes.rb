Rails.application.routes.draw do
  get 'categories/new'

  root 'static_pages#home'
  get 'login'  =>  'sessions#new'
  post  'login'  =>  'sessions#create'
  delete 'logout'  =>  'sessions#destroy'
  get 'signup'  =>  'users#new'
  resources :users

  resources :categories,only: [:index]
  namespace :admin do
    resources :categories,only: [:new, :create, :edit, :update, :destroy]
  end
end
