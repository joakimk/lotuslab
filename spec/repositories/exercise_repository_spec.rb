require "spec_helper"

describe ExerciseRepository, ".by_type" do
  it "returns exercises by type" do
    create Exercise.new(type: "C", calories: 50)
    create Exercise.new(type: "C", calories: 100)
    create Exercise.new(type: "R", calories: 200)
    exercises = ExerciseRepository.by_type("C")
    expect(exercises.map(&:calories)).to eq [ 50, 100 ]
  end
end

describe ExerciseRepository, ".with_calories_between" do
  it "returns exercises with calories between the two numbers", :sql do
    create Exercise.new(calories: 99)
    create Exercise.new(calories: 100)
    create Exercise.new(calories: 149)
    create Exercise.new(calories: 150)
    create Exercise.new(calories: 151)

    exercises = ExerciseRepository.with_calories_between(100, 150)
    expect(exercises.map(&:calories).sort).to eq [ 100, 149, 150 ]
  end
end
