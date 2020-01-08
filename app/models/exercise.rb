class Exercise < ApplicationRecord
    has_many :users, through: :workouts
    has_many :workouts 
end
