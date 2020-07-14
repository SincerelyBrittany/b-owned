Rails.application.routes.draw do
  resources :lists
  resources :users
  resources :companies
  resources :favorites
  resources :comments
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
