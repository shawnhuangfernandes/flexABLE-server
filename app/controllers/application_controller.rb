
class ApplicationController < ActionController::API

  # this method receives a user and returns a token
  def issue_token(user)
    JWT.encode({user_id: user.id}, 'secret_key', 'HS256')
  end

  # this method returns the user who has been assigned a token
  def current_user
    @user ||= User.find_by(id: user_id)
  end

  # this method assigns the header of authorization to the request
  def token
    request.headers['Authorization']
  end

  # this method decodes the token encrypted by a specific encryption algorithm
  def decoded_token
    begin
      JWT.decode(token, 'secret_key', true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{error: "Invalid Token"}]
    end
  end

  # this method first the user_id of the token
  def user_id
    decoded_token.first['user_id']
  end

  # this method checks if the user is currently logged in
  def logged_in?
    !!current_user
  end

  # this method encodes a new token
  def encode_token(payload)
    JWT.encode(payload, 'secret_key')
  end

end

