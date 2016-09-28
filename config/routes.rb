Rails.application.routes.draw do
  root to: 'static_pages#index'
  devise_for :users
  
  resources :users do
    resources :profiles, only: [:edit, :update, :destroy]
  end
  resources :profiles, only: [:new, :create]
  get 'users/:id/admin_new', to: 'profiles#admin_new', as: 'new_admin_profile'
  post 'users/:id/admin_create', to: 'profiles#admin_create', as: 'admin_profile'


  # resources :simei
  
end
