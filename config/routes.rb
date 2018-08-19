Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
      get :likeds
    end
    #collection do
     # get :search
    #end
  end
  
  resources :microposts, only: [:create, :destroy, :show] do
    member do
      post :retweet
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :relationshiplikes, only: [:create, :destroy]
  resources :replies
end
