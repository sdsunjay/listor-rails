Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
      resources :users, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :jobs, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :candidates, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :companies, only: [:new, :create, :index, :update, :edit]
      resources :candidates, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      root to: 'users#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
