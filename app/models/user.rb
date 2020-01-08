class User < ApplicationRecord
    has_secure_password
    
    has_many :exercises, through: :workouts
    has_many :workouts 

    validates :username, uniqueness: true
end
