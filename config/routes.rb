Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'home#index'

  # namespace :devise do
  #   get '/', to: 'sessions#new'
  #   # get '/users/:id', to: 'sessions#create'
  # end

  resources :users, only: [:show, :edit, :update]
  # get '/users/:id', to: 'users#show'

  resources :posts, only: [:new, :create, :index, :destroy]

  get 'search' => 'search#index'
end
