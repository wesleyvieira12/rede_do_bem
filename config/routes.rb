Rails.application.routes.draw do
  devise_for :users
  resources :states
  resources :cities
  resources :comments
  resources :services
  resources :users
  resources :categories

  #TELA INICIAL - Escolha das cidades
  root to: 'tela_inicial#index'  
  get '/tela_inicial/:alterar', to:'tela_inicial#index', as: 'alterar_cidade'
  
  #TELA DE INICIO - CATEGORIAS, FOTOS, COMENTARIOS
  post 'home', to: 'home#index'
  get 'home', to: 'home#index'
  post 'busca', to: 'home#busca'

  #PAINEL DO USUARIO
  get 'painel', to: 'painel#index'

  
end
