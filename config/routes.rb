Rails.application.routes.draw do
  post 'api/v1/auth/request', to:'api/v1/authorization#get_authorization'
  mount_devise_token_auth_for 'User', at: '/api/v1/auth', skip: [:omniauth_callbacks]
  
  namespace :api do
    namespace :v1 do 
      resources :users
    end 
  end 
end
