Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'login'
  get '/dashboard', to: 'dashboard#show'
end
