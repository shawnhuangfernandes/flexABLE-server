# Joiner mode for User and Exercise

class Workout < ApplicationRecord
    belongs_to :user # joiner association
    belongs_to :exercise # joiner association

    validates :user_id, presence: true # validation to make sure user is specified
    validates :exercise_id, presence: true # validation to make sure exercise is specified

    def self.workouts_of_the_week(user_id, day, month, year)
        workoutsArray=Array.new(7) # first create a workout array of size 7 to hold the workouts of the week
        today = Date.new(year, month, day) # get today's date
        $current_date = today - today.wday # then lets start from the beginning of the week (Monday is the start)

        workoutsArray.map.with_index do |val, index| # go through each day of the week
            workout_search_result = find_by_user_and_date(user_id, $current_date) # return the workout created by the user on that day
            $current_date = Date.new($current_date.year, $current_date.month, $current_date.day) + 1 # increment the current day
            workout_search_result
        end
    end

    def self.find_by_user_and_date(user_id, current_date)
        workouts_of_user = Workout.where(user_id: user_id)  # find all the workouts created by the user
        # detect first occurrence of workout of user
        workouts_of_user.select do |workout|
            w_date = workout.workout_date
            w_date.day == $current_date.day && w_date.month == $current_date.month && w_date.year == $current_date.year
        end
    end
end
