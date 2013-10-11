require 'reli/brainfuck'

module RELI
  class Braincrash < Brainfuck
    on(?|) do
      @memory[@pointer + 1] |= @memory[@pointer]
      @pointer += 1
      @index += @size
    end

    on(?&) do
      @memory[@pointer + 1] &= @memory[@pointer]
      @pointer += 1
      @index += @size
    end

    on(?~) do
      @memory[@pointer] = ~@memory[@pointer]
      @index += @size
    end

    on(?^) do
      @memory[@pointer + 1] ^= @memory[@pointer]
      @pointer += 1
      @index += @size
    end

    def initialize(options = {})
      super
      @memory = [72, 101, 108, 108, 111, 44, 32, 119, 111, 114, 108, 100, 33]
    end

    def run(code)
      super code + "[.>]"
    end
  end
end
