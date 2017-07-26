Rails.application.routes.draw do
  
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
      
    end
  end
end
