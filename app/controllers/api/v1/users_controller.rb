class Api::V1::UsersController < ApplicationController
    # def index
    #     @users = User.all
    #     render json: @users
    # end
    
    # def show
    #     @user = User.find(params[:id])
    #     if @user 

    #     else
            
    #     end 
    #     render json: @user
    # end
    
    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user: @user, jwt: token}
        else
            render json: {user: @user, message: 'not done'}
        end
    end

    private
    def user_params
        params.permit(:username, :password)
    end
    
end
