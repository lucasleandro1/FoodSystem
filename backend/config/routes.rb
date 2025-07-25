Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users

      # Rotas para restaurantes (Index e Show)
      resources :restaurants, only: [ :index, :show ] do
        # Rotas para visualizar os produtos de cada restaurante
        resources :products, only: [ :index, :show ]
      end

      # Rotas para pedidos (Create e Index)
      resources :orders, only: [ :create, :index ]

      # Reveal health status on /up that returns 200 if the app boots with no exceptions

      get "up" => "rails/health#show", as: :rails_health_check
    end
  end
end
