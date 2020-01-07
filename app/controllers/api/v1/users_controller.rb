class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        if @user 

        else
            
        end 
        render json: @user
    end
    
    def create
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            render json: {user: @user}
        else
            render json: {user: @user, message: 'not done'}
        end
    end

    
end
