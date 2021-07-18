Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :etsy, only: :index
      resources :users do
        resources :friends do
          resources :gifts
        end
      end
    end
  end
end
