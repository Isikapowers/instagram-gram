Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'devise/sessions#new'

  devise_for :users

  namespace :devise do
    get '/', to: 'sessions#new'
    # get '/users/:id', to: 'sessions#create'
  end

  resources :users, only: [:show, :edit, :update]
  # get '/users/:id', to: 'users#show'

  resources :posts, only: [:new, :create, :index, :destroy]

  get 'search' => 'search#index'
end
