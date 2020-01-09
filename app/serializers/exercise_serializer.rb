# Exercise Serializer Class that selects the available attributes on the Exercise Model
class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category
end
