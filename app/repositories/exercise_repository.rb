require "lotus/model"
require "exercise"

class ExerciseRepository
  include Lotus::Repository

  def self.by_type(type)
    query { where(type: type) }
  end

  def self.with_calories_between(from, to)
    # Alternative syntax, not as easy to read
    #query { where(calories: from..to) }

    # TODO: Find out how to escape input
    query { where("calories BETWEEN #{from} AND #{to}") }
  end
end

mapper = Lotus::Model::Mapper.new do
  collection :exercises do
    entity Exercise

    attribute :id, Integer
    attribute :type, String
    attribute :calories, Integer
    attribute :minutes, Integer
  end
end

mapper.load!

ExerciseRepository.adapter = DatabaseAdapter.build(mapper)
