Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do 
        resources :friends do 
          resources :gifts
        end
      end
    end
  end
end

# `Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   namespace :api do
#     namespace :v1 do
#       namespace :users do
#         get '/:user_id/friends', to: 'friends#index'
#         get '/:user_id/friends/:friend_id', to: 'friends#show'
#         post '/:user_id/friends/', to: 'friends#create'
#         post '/:user_id/friends/:friend_id', to: 'friends#delete'
#       end
#     end
#   end

#   '/:user_id/friends/:friend_id/gifts/:gift_id'`