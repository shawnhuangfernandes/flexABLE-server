class Api::V1::WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
        render json: @workouts
    end

    def create
        @workout = Workout.new(user_id: params[:user_id], exercise_id: params[:exercise_id], workout_date: Date.new(params[:year], params[:month], params[:day], completed: false))
        if @workout.save
            render json: {workout: @workout}
        else
            render json: {workout: @workout, message: 'not done'}
        end
    end

    def update
        @workout = Workout.find(params[:id])
        @workout.update(description: params[:new_description])
        render json: @workout
    end

    def workouts_for_the_week
        @this_weeks_workouts = Workout.workouts_of_the_week(params[:user_id], params[:day], params[:month], params[:year])
        render json: @this_weeks_workouts.to_json
    end

end
