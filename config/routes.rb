Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :welcome
    get 'maps/index'
    devise_for :users
    get 'welcome/homepage'
    root 'welcome#homepage'
    resources :contacts, only: [:new, :create]
    resources :maps, only: [:index]
    resources :reviews, only: [:index, :new, :create]
  end
end
