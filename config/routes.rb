Rails.application.routes.draw do
  devise_for :users
  get 'welcome/homepage'
  root 'welcome#homepage'
end
