# Joiner mode for User and Exercise

class Workout < ApplicationRecord
    belongs_to :user # joiner association
    belongs_to :exercise # joiner association

    validates :user_id, presence: true # validation to make sure user is specified
    validates :exercise_id, presence: true # validation to make sure exercise is specified
end
