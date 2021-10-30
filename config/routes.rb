Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "devise/sessions#new"
  namespace :devise do
    get '/', to: 'sessions#new'
  end

  resources :users, only: [:show, :edit, :update]
end
