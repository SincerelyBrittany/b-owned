Rails.application.routes.draw do
  root :to => "companies#index"
  resources :lists
  resources :users
  resources :companies
  resources :favorites
  resources :comments
  resources :company_lists

  resources :companies do 
    resources :favorites
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
