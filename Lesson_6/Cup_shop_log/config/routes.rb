Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
  	resources :cups
  end
  
  namespace :admin do
    resources :users 
  end  	

  resources :profiles

  root to: 'sessions#new'

  get 'sign_up',  to: 'users#new',        as: :sign_up
  get 'sign_in',  to: 'sessions#new',     as: :sign_in
  get 'sign_out', to: 'sessions#destroy', as: :sign_out
  post 'create',  to: 'sessions#create',  as: :sessions

  get 'all_users', to: 'admin#all_users', as: :all_users
  get 'all_cups',  to: 'admin#all_cups',  as: :all_cups
end
