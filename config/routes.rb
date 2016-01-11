Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  
  root to: "welcome#index"
  
  resources :users, only: [:update, :show] do
  
    resources :items, only: [:create, :new]
    
  end
  
end
