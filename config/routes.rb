Rails.application.routes.draw do
  #post 'api/v1/auth/request', to:'api/v1/authorization#get_authorization'
  #mount_devise_token_auth_for 'User', at: '/api/v1/auth', skip: [:omniauth_callbacks]
  post "/api/v1/login", to: "api/v1/sessions#create"
  post "/api/v1/signup", to: "api/v1/users#create"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  get "/api/v1/get_stream/:user_id", to: "api/v1/streams#get_stream"
  get "/api/v1/get_stash/:user_id", to: "api/v1/stashes#get_stash"
  delete "/api/v1/stashes/:id/remove_article/:article_id", to: "api/v1/stashes#remove_article"
  get "/api/v1/stream_sources/:stream_id", to: "api/v1/streams#stream_sources"
  patch "/api/v1/update_single_source/:source_id", to: "api/v1/streams#single_source"

  namespace :api do
    namespace :v1 do 
      resources :users
      resources :streams
      resources :stashes
      resources :articles
      resources :sources
      resources :password_resets
    end 
  end 
end



