class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            render json: @user
        else
            render json: {user: @user, message: 'not done'}
        end
end
