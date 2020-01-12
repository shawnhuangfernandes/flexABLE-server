# Workout Serializer Class that selects the available attributes on the Workout Model
class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :workout_date, :user_id, :exercise_id, :completed
end
