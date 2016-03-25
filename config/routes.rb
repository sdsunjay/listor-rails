Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
      resources :users, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :locations, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :jobs, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :submissions, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :notes, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :companies, only: [:new, :create, :index, :update, :edit, :destroy]
      resources :candidates, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      root to: 'candidates#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
