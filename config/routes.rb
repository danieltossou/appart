Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :locations
      resources :reservations

      root to: "users#index"
    end
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  resources :locations
  root to: 'pages#home'
  resources :reservations do
    collection do
      get 'me'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
