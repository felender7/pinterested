Rails.application.routes.draw do


  resources :pins
  devise_for :users
  root 'pins#index'
  get 'home/about'
  get 'users/index'
  get 'users/show'
end
