require "exercise"

ExerciseMapper = Lotus::Model::Mapper.new do
  collection :exercises do
    entity Exercise

    attribute :id, Integer
    attribute :type, String
    attribute :calories, Integer
    attribute :minutes, Integer
  end
end
