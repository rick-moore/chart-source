Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new', as: 'signup'
  get '/populate_setlist', to: 'setlists#populate_setlist'
  post '/renumber_setlist', to: 'setlists#renumber_setlist'
  post '/set_entries', to: 'set_entries#create'
  delete '/set_entries', to: 'set_entries#destroy'
  patch '/set_entries/:id/move', to: 'set_entries#move'
  
  resources :users, shallow: true do
    resources :arrangers
    resources :arrangements
    resources :songs
    resources :artists
    resources :setlists
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
