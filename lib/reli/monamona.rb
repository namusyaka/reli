require 'reli/brainfuck'

module RELI
  class Monamona < Brainfuck
    {
      ">" => "M",
      "<" => "O",
      "+" => "N",
      "-" => "A",
      "," => "m",
      "." => "o"
    }.each_pair{|key, value| change(value, key) }

    on("n") do
      if @memory[@pointer] == 0
        counter = 1
        while counter != 0 do
          @index += @size
          current = @code[@index, @size].join
          if current == "n"
            counter += 1
          elsif current == "a"
            counter -= 1
          end
        end
      end
      @index += @size
    end

    on("a") do
      if @memory[@pointer] != 0
        counter = 1
        while 0 < counter do
          @index -= @size
          current = @code[@index, @size].join
          if current == "n"
            counter -= 1
          elsif current == "a"
            counter += 1
          end
        end
      else
        @index += @size
      end
    end
  end
end
