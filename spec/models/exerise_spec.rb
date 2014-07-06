require "spec_helper"
require "exercise"

describe Exercise, "#name" do
  it "returns the name based on type" do
    exercise = Exercise.new(type: "C")
    expect(exercise.name).to eq("Cycle")
  end
end
