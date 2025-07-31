# config/routes.rb
Rails.application.routes.draw do
  # Authentication routes
  post "/signup", to: "users#create" # Changed to double quotes
  post "/login", to: "sessions#create" # Changed to double quotes

  # Todo API routes
  # For simplicity, we're not nesting todos under users directly in routes,
  # but the controller ensures todos belong to the current_user.
  resources :todos, only: [ :index, :show, :create, :update, :destroy ] # Added spaces and double quotes

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
