Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :contrats, except: [:edit, :update] do
    collection do
      get 'me', to: 'contrats#me', as: 'me'
      get 'confirmation/:id', to: 'contrats#confirmation', as: 'confirmation'
      get '/:id', to: 'contrats#show', as: 'show', defaults: { format: 'pdf' }
    end
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
