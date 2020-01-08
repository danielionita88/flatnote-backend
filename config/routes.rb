Rails.application.routes.draw do
  resources :note_tags, only: [:index, :destroy]
  resources :tags , only: [:index,:create]
  resources :notes
  resources :users, only: [:index, :create]
  get '/users/:id/notes', to: 'users#notes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
