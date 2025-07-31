# app/models/user.rb
class User < ApplicationRecord
  has_secure_password # This provides password hashing and authentication methods

  has_many :todos, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, on: :create # Only validate presence on creation
end
