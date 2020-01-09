# Main model for a user account

class User < ApplicationRecord
    has_secure_password # using bcrypt for backend authentication
    
    has_many :exercises, through: :workouts # has-many-through association
    has_many :workouts  # has-many (joiner)

    validates :username, uniqueness: true # validations for a unique username
end
