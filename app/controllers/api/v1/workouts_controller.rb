class Api::V1::WorkoutsController < ApplicationController
    def index
        @workouts = Workout.where(user_id: params[:user_id])
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

    private

    def workout_params
        params.require(:workout).permit(:id, :user_id, :exercise_id, :completed, :description, :workout_date)
    end

end
