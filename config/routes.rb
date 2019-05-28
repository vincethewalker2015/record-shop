Rails.application.routes.draw do
  #get 'signup/create'
  namespace :api do
    namespace :v1 do
      resources :artists
      resources :records
    end
  end
  
  root to: "home#index"
  
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
  
end