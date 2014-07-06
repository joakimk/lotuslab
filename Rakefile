task default: :spec

desc "Run all tests"
task :spec do
  system("rspec spec/**/*_spec.rb") || exit(1)
end

namespace :spec do
  desc "Run all unit tests"
  task :unit do
    ENV["UNIT_TEST"] = "true"
    Rake::Task["default"].invoke
  end
end
