class Repository
  include Lotus::Repository

  def self.inherited(subclass)
    mapper_name = subclass.name.sub(/Repository/, "Mapper")
    mapper = Kernel.const_get(mapper_name)
    subclass.adapter = DatabaseAdapter.build(mapper.load!)
  end
end

