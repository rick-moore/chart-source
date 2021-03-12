Rails.application.routes.draw do
  get '/', to: 'home#landing', as: 'landing_page'
  get '/home', to: 'home#home', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/password', to: 'users#edit_password', as: 'user_edit_password'
  patch '/users/:id/password', to: 'users#update_password', as: 'user_update_password'
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/populate_setlist', to: 'setlists#populate_setlist'
  post '/renumber_setlist', to: 'setlists#renumber_setlist'
  post '/set_entries', to: 'set_entries#create'
  delete '/set_entries', to: 'set_entries#destroy'
  patch '/set_entries/:id/move', to: 'set_entries#move'

  resources :users
  resources :arrangements
  resources :arrangers, :artists, :songs, :genres, only: %i[ index show ]
  resources :setlists 
  resources :charts
  resources :memberships, only: %i[ destroy create edit update ]
  resources :setlist_shares, only: %i[ destroy create ]
  
  resources :teams do
    resources :setlists, only: %i[ show ]
    resources :arrangements, only: %i[ index show ]
    resources :setlist_shares, only: %i[ new ]
  end

end
