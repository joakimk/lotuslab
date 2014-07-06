require "pg"
require "lotus/model/adapters/sql_adapter"
require "lotus/model/adapters/memory_adapter"
require "lotus/model"
require "mappings"

# Single place to switch adapter for all repositories
class DatabaseAdapter
  def self.build(mapper)
    if ENV["UNIT_TEST"]
      Lotus::Model::Adapters::MemoryAdapter.new(mapper)
    else
      Lotus::Model::Adapters::SqlAdapter.new(mapper, ENV["SQL_CONNECTION_URL"])
    end
  end
end

require "exercise_repository"
