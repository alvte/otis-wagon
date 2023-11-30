Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [] do
    resources :chatrooms, only: [:index, :show] do
      resources :messages, only: :create
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "pages#home"
  resources :chatrooms, only: [:show, :new, :create]

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  resources :cards, only: [:index, :show]
end
