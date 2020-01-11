class Api::V1::UsersController < ApplicationController    
    # Creates a user on request and provides the user information and token back on success
    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user: @user, jwt: token, success: 'Successfully Created Account'}
        else
            puts @user.errors.full_messages
            render json: {user: @user, failure: 'Could Not Create User'}
        end
    end

    # Helper Methods
    private

    # Strong params to permit only specific user attributes
    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name)
    end
    
end
