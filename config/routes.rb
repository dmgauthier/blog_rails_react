Rails.application.routes.draw do
  # root 'articles#index'
  get 'articles', to: 'articles#index'

  get '/secret', to: 'pages#index', as: :secret
  root to: 'pages#index'
  
  resources :users, only: [:new, :create] do 
    member do
      get :activate
    end
  end
  get '/sign_up', to: 'users#new', as: :sign_up
  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
  resources :reset_passwords, only: [:new, :create, :update, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
