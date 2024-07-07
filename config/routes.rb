Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/actors', to: "actors#index"
      post '/actors', to: "actors#create"
      put '/actors/:id', to: "actors#update"
      delete '/actors/:id', to: "actors#destroy"
      get '/actors/:id', to: "actors#get_actor_by_id"
    end
  end
end
