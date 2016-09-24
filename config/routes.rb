Rails.application.routes.draw do
  # get 'users/index'

  # get 'users/show'

  # get 'simeis/new'

  # get 'profiles/profile'

  devise_for :users
  
  resources :users do
    resources :profiles, except: [:new, :create]
  end
  resources :profiles, only: [:new, :create]
  
  
  root to: 'static_pages#index'

  # resources :simei
  
end
