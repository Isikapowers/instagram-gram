Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'home#index'

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:new, :create, :index, :destroy]

  get 'search' => 'search#index'
end
