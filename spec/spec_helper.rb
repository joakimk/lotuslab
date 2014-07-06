$: << File.expand_path("config")

require_relative "../config/application"

unless ENV["UNIT_TEST"]
  database = Sequel.connect(ENV["SQL_CONNECTION_URL"])

  database.create_table! :exercises do
    primary_key :id

    String :type
    Integer :calories
    Integer :minutes
  end
end

module Helpers
  def create(entity)
    Kernel.const_get("#{entity.class.name}Repository").create(entity)
  end
end

RSpec.configure do |config|
  config.after do
    ExerciseRepository.clear
  end

  config.filter_run_excluding(:sql) if ENV["UNIT_TEST"]
  config.include(Helpers)
end
