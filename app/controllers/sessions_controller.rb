# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  # POST /login
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # For simplicity, we'll return user ID and email.
      # In a real app, you'd generate and return a JWT token here.
      render json: { user: user.as_json(only: [ :id, :email ]), message: "Logged in successfully" }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
