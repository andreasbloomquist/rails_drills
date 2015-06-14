Rails.application.routes.draw do
  resources :users, :articles

  get '/login', to: 'sessions#new', as: 'login'

  post '/sessions', to: 'sessions#create'
  post '/logout', to: 'users#log_out', as: 'logout'
end
