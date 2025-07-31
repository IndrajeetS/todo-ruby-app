# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  before_action :set_current_user # Ensure user is identified
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = @current_user.todos.order(created_at: :desc) # Fetch todos for the current user
    render json: @todos
  end

  # GET /todos/:id
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = @current_user.todos.new(todo_params) # Create todo for the current user

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/:id
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content # Return a 204 No Content status
  end

  private

  # Set the current user based on a simple mock for now.
  # In a real app, this would involve parsing a JWT token from the Authorization header.
  def set_current_user
    # For demonstration, assume a user is "logged in" if their ID is passed.
    # Replace this with actual token-based authentication (e.g., JWT)
    # For now, let's assume a user ID is passed in headers for simplicity.
    # Example: Authorization: Bearer <user_id_here>
    # This is highly insecure and for development ONLY.
    user_id = request.headers['Authorization']&.split(' ')&.last
    @current_user = User.find_by(id: user_id)

    unless @current_user
      render json: { error: 'Unauthorized: Please log in or provide a valid user ID.' }, status: :unauthorized
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    # Ensure the todo belongs to the current user
    @todo = @current_user.todos.find_by(id: params[:id])
    unless @todo
      render json: { error: 'Todo not found or you are not authorized to access it.' }, status: :not_found
    end
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.permit(:title, :description, :completed)
  end
end
