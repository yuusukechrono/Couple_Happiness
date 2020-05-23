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
  resources :meetings
  resources :user_matches
  resources :answers do   
    collection do
    get :answer_to_question
    end
  end
  resources :sessions, only: [:new, :create, :destroy] do
    collection do
      get :new_professional
      post :create_professional
      get :destroy_professional
    end
  end
  resources :professionals
  resources :consultation_rooms do
    resources :messages
  end
end