Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  
  root to: "welcome#index"
  
  resources :users, only: [:update, :show]
  
end
