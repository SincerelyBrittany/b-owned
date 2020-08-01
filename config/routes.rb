Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => "companies#index"
  
  get "/signup" => "users#new", as: "signup"
  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :users
  # resources :companies
  resources :comments, only: [:create, :new]
  resources :lists
  resources :company_lists, only:[:create, :destroy]

  resources :companies do 
    resources :favorites, only: [:index, :create]
    resources :comments, only: [:edit, :update, :destroy]
  end   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
