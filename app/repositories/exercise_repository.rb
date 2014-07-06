require "repository"

class ExerciseRepository < Repository
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
