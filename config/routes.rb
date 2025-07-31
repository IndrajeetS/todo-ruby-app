Rails.application.routes.draw do
  # Authentication routes
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'

  # Todo API routes
  # For simplicity, we're not nesting todos under users directly in routes,
  # but the controller ensures todos belong to the current_user.
  resources :todos, only: [:index, :show, :create, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
