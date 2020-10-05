Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    resources :users do
      resources :tweets do
        resources :likes
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
  root 'admin/dashboard#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :friends
  resources :tweets do 
    get 'tweets/:id', to: 'tweets#show', as: 'retweet'
    resources :likes
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
