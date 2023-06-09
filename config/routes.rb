Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'

  get '/property/:user_id/:property_id', to: 'properties#show', as: 'property'

  get '/sign_up', to: 'users#new'
  get '/login', to: 'sessions#new'

  post '/user_properties', to: 'user_properties#create'
  delete 'user_properties', to: 'user_properties#destroy'

  delete '/logout', to: 'sessions#destroy'
end
