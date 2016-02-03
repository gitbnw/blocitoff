Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  
  root to: "welcome#index"
  
  resources :users, only: [:show] do

    resources :items, only: [:create, :new, :delete, :destroy] do

      put 'status'

    end
    
  end
  
end
