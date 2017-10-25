Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#new', as: 'login'
  post '/', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/messages/sent', :to => 'messages#sent'
  resources :friend
  resources :users
  resources :messages
end
