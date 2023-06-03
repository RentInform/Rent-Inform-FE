Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root '/', to: 'welcome#index'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
end
