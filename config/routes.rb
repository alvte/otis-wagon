Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [] do
    resources :chatrooms, only: %i[index show] do
      resources :messages, only: :create
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get "newhome", to: "pages#newhome"

  # Defines the root path route ("/")
  root to: "cards#index"
  resources :chatrooms, only: %i[show new create] do
    patch :deactivate_chat_GPT, on: :member
  end

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  resources :cards, only: %i[index show]
end
