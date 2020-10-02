Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :tweets do 
    resources :likes
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
