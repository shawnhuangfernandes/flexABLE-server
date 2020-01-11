# Joiner mode for User and Exercise

class Workout < ApplicationRecord
    belongs_to :user # joiner association
    belongs_to :exercise # joiner association

    validates :user_id, presence: true # validation to make sure user is specified
    validates :exercise_id, presence: true # validation to make sure exercise is specified

    def self.workouts_of_the_week(:user_id, :day_of_the_week, :day, :month, :year)
        workoutsArray=Array.new(7) # first create a workout array of size 7 to hold the workouts of the week
        current_day = day - day_of_the_week # then lets start from the beginning of the week (Monday is the start)
        workoutsArray.map.with_index do |val, index| # go through each day of the week
            find_by_user_and_date(user_id: user_id, current_day: current_day, month: month, year: year) # return the workout created by the user on that day
            current_day += 1;
        end

    end

    def self.find_by_user_and_date(:user_id, :day, :month, :year)
        # find all the workouts created by the user
        # look through all the workouts of that user
            # if any of those workouts contain a DATE object that is of the day, month, and year
                # return it
        # return null
        workouts_of_user = Workout.find_by(user_id: user_id)
    end
end
