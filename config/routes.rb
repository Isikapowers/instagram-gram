Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_sessions
    get 'users/sign_out', to: 'users/sessions#destroy'
  end

  root to: 'home#index'

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:new, :create, :index, :destroy]

  get 'search' => 'search#index'
end
