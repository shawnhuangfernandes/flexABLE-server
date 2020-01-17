class Api::V1::WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
        render json: @workouts
    end

    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            render json: @workout
        else
            render json: {workout: @workout, message: 'not done'}
        end
    end

    def update
        @workout = Workout.find(params[:id])
        @workout.update(workout_params)
        render json: @workout
    end

    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy
        render json: {
            message: 'successfully destroyed'
        }
    end

    def workouts_for_the_week
        @this_weeks_workouts = Workout.workouts_of_the_week(params[:user_id], params[:day], params[:month], params[:year])
        render json: @this_weeks_workouts.to_json
    end

    private

    def workout_params
        params.require(:workout).permit(:user_id, :exercise_id, :year, :month, :day, :completed, :description)
    end

end
