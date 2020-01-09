# Main model for an exercise to be done by the user

class Exercise < ApplicationRecord
    has_many :users, through: :workouts # has-many-through association
    has_many :workouts # has-many (joiner)
end
