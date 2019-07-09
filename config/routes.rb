Rails.application.routes.draw do
  root 'home#top'
  get '/signup', to: 'items#new'
end
