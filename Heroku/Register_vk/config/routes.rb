Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'sessions#new'

  resources  :sessions, only: [:new, :create]
  get 'logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
end
