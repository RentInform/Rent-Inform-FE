Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
  get '/sign_up', to: 'users#new'
  get '/login', to: 'sessions#new'
 delete '/logout', to: 'sessions#destroy'
end
