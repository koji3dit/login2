Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'simeis/new'

  get 'profile_pages/profile'

  devise_for :users
  
  resources :users, only: [:show, :new] do
    resources :profile_pages
  end
  
  root to: 'static_pages#index'

  resources :simei
  
end
