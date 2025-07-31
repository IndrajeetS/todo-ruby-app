# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # POST /signup
  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user.as_json(only: [ :id, :email ]), message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
