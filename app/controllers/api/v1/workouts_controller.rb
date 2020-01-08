class Api::V1::WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
        render json: @workouts
    end

    def create
        @workout = Workout.new(user_id: params[:user_id], exercise_id: params[:exercise_id], workout_date: Date.new(params[:year], params[:month], params[:day]))
        if @workout.save
            byebug
            render json: {workout: @workout}
        else
            render json: {workout: @workout, message: 'not done'}
        end
    end

end
