Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users ,path: "", path_prefix: "devise", controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        get "users" => "users#show"
        post "users" => "users#create"
        post "login" => "sessions#create", as: "login"
        delete "logout" => "sessions#destroy", as: "logout"
        put "password/update", to: "registrations#update_password"
      end
    end
  end

  # resources :users, only: [:show, :create, :update, :destroy], constraints: { id: /.*/ }

  root "home#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :requests 
      resources :fulfillments
      resources :messages
    end
  end
 
end
