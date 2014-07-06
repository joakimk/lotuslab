require "pg"
require "lotus/model/adapters/sql_adapter"
require "lotus/model/adapters/memory_adapter"
require "lotus/model"

$: << File.expand_path("config")
$: << File.expand_path("app/models")
$: << File.expand_path("app/repositories")

require "mappings"

ENV["SQL_CONNECTION_URL"] = "postgres://localhost:5432/lotuslab"

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
