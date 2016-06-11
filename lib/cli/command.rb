module CLI
  class Command
    attr_reader :name, :description

    def initialize(name, description, &block)
      @name, @description, @block = name, description, &block
    end

    def execute
      @block.call
    end
  end
end