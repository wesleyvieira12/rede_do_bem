Rails.application.routes.draw do
  resources :states
  resources :cities
  resources :comments
  resources :services
  resources :users
  resources :categories
  root to: 'painel#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
