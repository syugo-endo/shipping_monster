Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :welcome
    get 'maps/index'
    devise_for :users
    get 'welcome/homepage'
    root 'welcome#homepage'
    resources :contacts, only: %i[new create]
    resources :maps, only: [:index]
    resources :reviews, only: %i[index new create]
  end
end
