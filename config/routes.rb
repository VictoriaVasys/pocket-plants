Rails.application.routes.draw do
  root to: 'home#index'
  get '/sign_up', to: 'users#new'
  get '/log_out', to: 'sessions#destroy'
  
  resources :sessions, only: [:create]
  resources :users, only: [:create]
  namespace :users, path: ":username" do
    resources :favorite_flower_photos, only: [:index]
    get '/:flower_photo_name' => 'flower_photos#show', as: :flower_photo
  end
  resources :flower_photos, only: [:index]
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      
      namespace :plant_families do
        get 'find', to: 'find#show'
      end
      resources :plant_families, only: [:index, :show]
      
      concern :favorable do
        resources :favorites, only: [:create, :destroy]
      end
      
      namespace :flower_photos do
        get 'find', to: 'find#index'
        resources :favorites, only: [:create, :destroy]
      end
      resources :flower_photos, only: [:index]
      
      namespace :users do
        namespace :flower_photos do
          get 'find', to: 'find#show'
        end
        get '/:user_id/favorite_flower_photos' => 'favorites#index', as: :favorite_flower_photos
        resources :flower_photos, only: [:show], concerns: :favorable do
          resources :gvision_descriptions, only: [:index, :create, :destroy] do
            post '/favorites' => 'gvision_descriptions/favorites#create', as: :favorites
            delete '/favorites/:id' => 'gvision_descriptions/favorites#destroy', as: :favorite
          end
          resources :comments, only: [:index, :show, :create, :update, :destroy] do
            post '/favorites' => 'comments/favorites#create', as: :favorites
            delete '/favorites/:id' => 'comments/favorites#destroy', as: :favorite
          end
          
        end
      end
    end
  end
end
