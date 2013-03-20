module Furnace
  class SSA::Argument < SSA::NamedValue
    attr_reader :type

    def initialize(function, type, name)
      super(function, name)
      self.type = type
    end

    def type=(type)
      @type = type.to_type
    end

    def replace_type_with(type, replacement)
      self.type = self.type.replace_type_with(type, replacement)
    end

    def awesome_print(p=AwesomePrinter.new)
      p.nest(@type).
        name(name)
    end
  end
end
