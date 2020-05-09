Rails.application.routes.draw do
  get 'sessions/new'
  root 'sessions#new'
  resources :users, only: [:new, :create, :show, :edit, :update, :index] do
    collection do
      get :search
    end
  end
  resources :plans
  resources :promises
  resources :user_matches
  resources :sessions, only: [:new, :create, :destroy]
end