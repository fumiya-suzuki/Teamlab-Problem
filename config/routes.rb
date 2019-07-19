Rails.application.routes.draw do
  get 'companies/index'

  root 'home#top'
  get '/signup', to: 'items#new'
  get 'login', to: 'companies#login_page'
  
  resources :items 
  resources :companies
end
