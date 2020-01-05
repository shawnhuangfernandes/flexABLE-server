class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            redirect_to controller: 'auth', action: 'create', username: @user.username, password: @user.password
        else
            render json: {user: @user, message: 'not done'}
        end
    end

    private
end
