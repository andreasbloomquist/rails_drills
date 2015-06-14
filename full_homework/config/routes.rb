Rails.application.routes.draw do

  resources :users, :articles

  root to: "articles#index"
  
  get '/login', to: 'sessions#new', as: 'login'

  post '/sessions', to: 'sessions#create'
  post '/logout', to: 'users#log_out', as: 'logout'

end
