class Exercise
  include Lotus::Entity

  TYPES = {
    "C" => "Cycle"
  }

  def name
    TYPES.fetch(type)
  end

  self.attributes = :type, :calories, :minutes
end
