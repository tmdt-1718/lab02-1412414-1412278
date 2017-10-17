Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#new', as: 'login'
  post '/', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :messages
end