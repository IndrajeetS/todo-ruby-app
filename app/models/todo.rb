# app/models/todo.rb
class Todo < ApplicationRecord
  belongs_to :user # A todo belongs to a user
end
