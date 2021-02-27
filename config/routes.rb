Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end