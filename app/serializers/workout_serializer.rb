class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :workout_date, :user_id, :exercise_id
end
