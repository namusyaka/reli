require 'reli/abstract'

module RELI
  class Brainfuck < Abstract

    on(?+) do
      @memory[@pointer] += 1
      @index += @size
    end

    on(?-) do
      @memory[@pointer] -= 1
      @index += @size
    end

    on(?>) do
      @pointer += 1
      @index   += @size
      @memory[@pointer] = 0 unless @memory[@pointer]
    end

    on(?<) do
      @pointer -= 1
      @index   += @size
      raise "Error: Pointer received a negative number." if @pointer < 0
    end

    on(?.) do
      @buffer[@buffer.length] = @memory[@pointer].chr
      @index += @size
    end

    on(?,) do
      str = $stdin.getc
      @memory[@pointer] = str ? str.ord : 0;
      @index += @size
    end

    on(?[) do
      if @memory[@pointer] == 0
        counter = 1
        while counter != 0 do
          @index += @size
          current = @code[@index, @size].join
          if current == ?[
            counter += 1
          elsif current == ?]
            counter -= 1
          end
        end
      end
      @index += @size
    end

    on(?]) do
      if @memory[@pointer] != 0
        counter = 1
        while 0 < counter do
          @index -= @size
          current = @code[@index, @size].join
          if current == ?[
            counter -= 1
          elsif current == ?]
            counter += 1
          end
        end
      else
        @index += @size
      end
    end
  end
end
