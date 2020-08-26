Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users
  get 'welcome/homepage'
  root 'welcome#homepage'
  resources :contacts, only: [:new, :create]
  resources :maps, only: [:index]
end
