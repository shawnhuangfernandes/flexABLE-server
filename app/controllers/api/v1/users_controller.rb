class Api::V1::UsersController < ApplicationController    
    # Creates a user on request and provides the user information and token back on success
    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {id: @user.id, username: @user.username, first_name: @user.first_name, last_name: @user.last_name, jwt: token}
        else
            puts @user.errors.full_messages
            render json: {user: @user, error: 'Could Not Create User'}
        end
    end

    def update
        byebug
        @user = User.find(params[:id])
        @user.update(first_name: params[:first_name], last_name: params[:last_name], username: params[:username])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {
            message: "Deleted User!"
        }
    end


    # Helper Methods
    private

    # Strong params to permit only specific user attributes
    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name)
    end
    
end
