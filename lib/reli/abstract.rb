
module RELI
  class Abstract
    def initialize(options = {})
      @memory  = []
      @buffer  = []
      @pointer = 0; @memory[0] = 0
      @size    = 1
      @break   = 0
    end

    def run(code)
      @code  = code.split(//u)
      @index = 0
      code_length = @code.length
      while @index < code_length do
        method_name = "exec_#{@code[@index, @size].join}"
        @index += @break
        next unless respond_to?(method_name)
        send(method_name)
      end
      @buffer.join
    end

    def self.on(char, &block)
      define_method "exec_#{char}", &block
    end

    def self.change(new, old)
      old_method = instance_method("exec_#{old}")
      define_method("exec_#{new}", old_method)
    end
  end
end
