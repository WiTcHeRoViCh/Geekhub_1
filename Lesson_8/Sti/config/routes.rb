Rails.application.routes.draw do

  resources :fruits

  resources :vegetables

  resources :mains, only: [:index]

  root 'mains#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
