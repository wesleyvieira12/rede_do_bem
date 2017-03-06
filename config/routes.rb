Rails.application.routes.draw do

  resources :sobres
  resources :contatos
  resources :image_services

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      },:path => 'u'

  resources :states
  resources :cities
  resources :comments
  resources :services
  resources :users
  resources :categories

  get 'comments/novo/:id', to:'comments#new', as: 'novo_comentario'

  get 'home/index', to:'users#index', as:'mostrar_servico'

  get 'users/show/:id', to:'users#destacar', as:'destacar_usuario'

  get 'users/novo/:id', to:'users#change', as: 'mostrar_usuario'

  get 'users/show', to:'users#desactive', as: 'desactive_usuario'

  get 'comments/report/:id', to:'users#report', as: 'report_comentario'

  #TELA INICIAL - Escolha das cidades
  root to: 'tela_inicial#index'  
  get '/tela_inicial/:alterar', to:'tela_inicial#index', as: 'alterar_cidade'
  
  #TELA DE INICIO - CATEGORIAS, FOTOS, COMENTARIOS
  post 'home', to: 'home#index'
  get 'home', to: 'home#index'
  post 'busca', to: 'home#busca'
  get 'busca/:id', to: 'home#busca', as: "busca_category_id"
  get 'home/professional/:id', to: 'home#show_professional', as: "show_professional"
  get 'home/service/:id', to: 'home#show_service', as: "show_service"

  #PAINEL DO USUARIO
  get 'painel', to: 'painel#index'

  
end
