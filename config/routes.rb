Rails.application.routes.draw do
  root to: 'home#index'
  get '/sign_up', to: 'users#new'
  get '/log_out', to: 'sessions#destroy'
  
  resources :sessions, only: [:create]
  resources :users, only: [:create]
  namespace :users, path: ":username" do
    resources :favorite_flower_photos, only: [:index]
  end
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      
      namespace :plant_families do
        get 'find', to: 'find#show'
      end
      resources :plant_families, only: [:index, :show]
      
      namespace :flower_photos do
        get 'find', to: 'find#show'
      end
      resources :flower_photos, only: [:index, :show]
      
      namespace :users, path: ":username" do
        namespace :flower_photos, path: ":flower_photo_name" do
          resources :gvision_descriptions, only: [:index, :show, :create, :update, :destroy]
        end
      end
    end
  end
end
