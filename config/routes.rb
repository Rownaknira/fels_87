Rails.application.routes.draw do
  get	'signup'  =>  'users#new'
  resources	:users
  root	'static_pages#home'
end
