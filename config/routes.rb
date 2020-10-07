Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    resources :users do
      resources :tweets do
        resources :likes
        resources :friends
      end
    end
  end
  namespace :admin do
    resources :users do
      resources :likes
    end
  end
  namespace :admin do
    resources :tweets do
      resources :likes
    end
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :tweets do 
    get 'tweets/:id', to: 'tweets#show', as: 'retweet'
    
    resources :likes
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users do
    resources :friends
  end
  
  get '/api/:2020-10-06/:2020-10-07', to: 'tweets#dates'
  get 'api/news', to: 'tweets#news'
  resources :friends, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
