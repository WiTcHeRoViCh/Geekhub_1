# frozen_string_literal: true
Rails.application.routes.draw do
  resources :users do
    resources :carts, only: [:index, :destroy, :new]
    resources :items
  end

  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
