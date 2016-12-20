Rails.application.routes.draw do
  root 'users#index'
  
  resources :positions
  resources :items do 
  	resources :positions
  end
  	
  resources :users do 
  	resources :items
    resources :carts, only: [:index]
  end	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
