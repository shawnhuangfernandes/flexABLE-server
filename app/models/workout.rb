# Joiner mode for User and Exercise

class Workout < ApplicationRecord
    belongs_to :user # joiner association
    belongs_to :exercise # joiner association

    validates :user_id, presence: true # validation to make sure user is specified
    validates :exercise_id, presence: true # validation to make sure exercise is specified

    def self.workouts_of_the_week(user_id, day, month, year)
        workoutsArray=Array.new(7) # first create a workout array of size 7 to hold the workouts of the week
        today = Date.new(year, month, day) # get today's date
        current_date = today - today.wday # then lets start from the beginning of the week (Monday is the start)
        workoutsArray.map.with_index do |val, index| # go through each day of the week and RETURN the mapped version of it
            tracked_date = current_date + index
            workout_search_result = find_by_user_and_date(user_id, tracked_date) # find the workouts created by the user on the current day of the week
        end
    end

    def self.find_by_user_and_date(user_id, current_date)
        return workouts_of_user = Workout.where(user_id: user_id).filter do |workout|
            byebug
            workout.workout_date.day == current_date.day &&
            workout.workout_date.month == current_date.month &&
            workout.workout_date.year == current_date.year         
        end
    end
end
