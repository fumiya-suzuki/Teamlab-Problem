Rails.application.routes.draw do
  root 'home#top'
  get '/signup', to: 'items#new'
  get 'items/:id/edit', to: 'items#edit', as: :edit_item
  get 'items/:id/update', to: 'items#update', as: :update_item

  
  resources :items 
end
