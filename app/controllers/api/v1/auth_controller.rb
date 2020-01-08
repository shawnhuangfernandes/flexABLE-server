class Api::V1::AuthController < ApplicationController
  # This action assigns a token to a user and renders that token (along with the user info) back to the front end 
  # This is supposed to be used on a new login 
  def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        token = issue_token(@user)
        render json: {id: @user.id, username: @user.username, jwt: token}
      else
        render json: {error: 'That user could not be found'}, status: 401
      end
    end
  
  # This action checks to see if a user is logged in and returns the user info if so
  def user_is_authed
    @user = User.find_by(id: user_id)
    if logged_in?
      render json: {id: @user.id, username: @user.username}
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end
  
  end