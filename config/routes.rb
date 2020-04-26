Rails.application.routes.draw do
  get 'sessions/new'
  root 'sessions#new'
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
end
