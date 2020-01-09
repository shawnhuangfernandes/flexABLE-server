# User Serializer Class that selects the available attributes on the User Model
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name
end
