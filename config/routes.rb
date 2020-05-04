Rails.application.routes.draw do
  get 'sessions/new'
  root 'sessions#new'
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :users do
    collection do
      get :search
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
end
