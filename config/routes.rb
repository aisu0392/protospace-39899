Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get 'prototypes/index'
  get '/users/:name', to: 'users#show', as: :user_by_name

  root 'prototypes#index'

  resources :prototypes
  resources :users, only: [:show]

  resources :prototypes do
    resources :comments, only: [:create]
  end
end

