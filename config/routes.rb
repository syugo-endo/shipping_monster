Rails.application.routes.draw do
  devise_for :users
  get 'welcome/homepage'
  root 'welcome#homepage'
  resources :contacts, only: [:new, :create]
end
