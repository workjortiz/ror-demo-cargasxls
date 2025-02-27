Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "shared#home"

  # Non CRUD Pages
  get "shared/home" => "shared#home", :as => "shared_home"

  # Models
  resources :unit_measures
  resources :brands
  resources :countries
  resources :params
  resources :products do
    collection { 
      post :import 
    }
    
  end

  # Custom
  get "product/info" => "products#info", :as => "product_info"
  get "products/load-data/result" => "products#load_data_result", :as => "products_load_data_result"
  get "products/load-data/index" => "products#load_data_index", :as => "products_load_data_index"

  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  

  
end
