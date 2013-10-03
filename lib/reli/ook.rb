require 'reli/brainfuck'

module RELI
  class Ook < Brainfuck
    {
      ">" => "Ook. Ook?",
      "<" => "Ook? Ook.",
      "+" => "Ook. Ook.",
      "-" => "Ook! Ook!",
      "," => "Ook. Ook!",
      "." => "Ook! Ook."
    }.each_pair{|key, value| change(value, key) }

    def initialize(*)
      super
      @break = 1
      @size  = 9
    end

    on("Ook! Ook?") do
      if @memory[@pointer] == 0
        counter = 1
        while counter != 0 do
          @index += @size
          current = @code[@index, @size].join
          if current == "Ook! Ook?"
            counter += 1
          elsif current == "Ook? Ook!"
            counter -= 1
          end
        end
      end
      @index += @size
    end

    on("Ook? Ook!") do
      if @memory[@pointer] != 0
        counter = 1
        @index -= @break
        while 0 < counter do
          @index -= @size + @break
          current = @code[@index, @size].join
          if current == "Ook! Ook?"
            counter -= 1
          elsif current == "Ook? Ook!"
            counter += 1
          end
        end
      else
        @index += @size
      end
    end
  end
end
