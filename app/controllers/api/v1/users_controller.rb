class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(params[:user])
        if @user.save
            render json: @user
        else
            render json: {user: @user, message: 'not done'}
        end
    end
end
