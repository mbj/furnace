module Furnace
  class SSA::Constant < SSA::Value
    attr_accessor :type
    attr_accessor :value

    def initialize(type, value)
      super()

      @value, @type = value, type
    end

    def constant?
      true
    end

    def ==(other)
      if other.respond_to? :to_value
        other_value = other.to_value

        other_value.constant? &&
            other_value.type  == type &&
            other_value.value == value
      else
        false
      end
    end

    def inspect_as_value(p=SSA::PrettyPrinter.new)
      p.type type
      p.text @value.inspect unless type == SSA::Void
      p
    end

    def inspect
      pretty_print
    end
  end
end