Rails.application.routes.draw do
  resources :pins, :profile
  devise_for :users
  root 'pins#index'
  get 'home/about'
end
