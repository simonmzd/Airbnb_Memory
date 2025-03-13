Rails.application.routes.draw do
  devise_for :users
  root to: "memories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :memories, only: %i[index show new create] do
    resources :bookings, only: %i[new create destroy] do
      member do
        patch :accept
        patch :reject
      end
    end
  end
  get "dashboard", to: "pages#dashboard"
  # Defines the root path route ("/")
  # root "posts#index"
end
