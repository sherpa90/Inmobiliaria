Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :edificios
  resources :comunas
  root 'home#index'

  resources :departamentos, only: [:index, :show]
  namespace :admin do
    resources :departamentos, only: [:index, :edit, :update, :destroy]
  end
end