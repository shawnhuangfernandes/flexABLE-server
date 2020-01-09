class Api::V1::ExercisesController < ApplicationController
    # Returns all the exercises as json
    def index
        @exercises = Exercise.all
        render json: @exercises
    end
end
