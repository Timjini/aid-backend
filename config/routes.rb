Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users ,path: "", path_prefix: "devise", controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        get "all_users" => "users#index"
        get "users" => "users#show"
        post "users" => "users#create"
        post "login" => "sessions#create", as: "login"
        delete "logout" => "sessions#destroy", as: "logout"
        put "password/update", to: "registrations#update_password"
      end
    end
  end


  root "home#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :requests do
        collection do
          get :my_requests
        end
      end
      resources :fulfillments do
        collection do
          get :my_fulfillments
        end
      end
      resources :messages
      resources :bikers
      resources :contests
    end
  end
 
end
