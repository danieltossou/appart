Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
      resources :users
      resources :locations
      resources :reservations

      root to: "users#index"
    end
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }
  resources :locations 
  
  root to: 'pages#home'
  get 'search', to: 'pages#search'
  
  resources :reservations do
    collection do
      get 'me'
    end
  end
  resources :notifications, except: [:edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
