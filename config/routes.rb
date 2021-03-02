Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new', as: 'signup'
  get '/populate_setlist', to: 'setlists#populate_setlist'
  get '/add_to_setlist', to: 'setlists#add_to_setlist'
  
  resources :users do
    resources :arrangers
    resources :arrangements
    resources :songs
    resources :artists
    resources :setlists
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
