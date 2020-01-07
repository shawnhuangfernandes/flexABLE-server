class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            render json: {user: @user}
        else
            render json: {user: @user, message: 'not done'}
        end
    end
end
