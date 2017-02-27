Rails.application.routes.draw do
  devise_for :users
  resources :states
  resources :cities
  resources :comments
  resources :services
  resources :users
  resources :categories

  root to: 'tela_inicial#index'  

  get 'home', to: 'home#index'
  post 'home', to: 'home#index'

  get 'painel', to: 'painel#index'

  
end
