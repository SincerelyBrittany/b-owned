Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root :to => "companies#index"
  resources :lists
  resources :companies
  resources :favorites
  resources :comments
  resources :company_lists

  resources :companies do 
    resources :favorites
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
