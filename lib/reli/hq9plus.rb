require 'reli/abstract'

module RELI
  class Hq9plus < Abstract
    def initialize(options = {})
      super
      @a = 0
    end

    on(?H) do
      @buffer << "Hello, world!"
      @index += @size
    end

    on(?Q) do
      @buffer += @code
      @index += @size
    end

    on(?9) do
      99.downto(1) { |i|
        @buffer << <<-EOS.gsub(/^ */, "")
          #{bottles i} of beer on the wall, #{bottles i} of beer.
          Take one down and pass it around, #{bottles i - 1} of beer on the wall.
        EOS
      }
      @buffer << <<-EOS.gsub(/^ */, "")
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      EOS
      @index += @size
    end

    on(?+) do
      @a += 1
      @index += @size
    end

    def bottles(i)
      [i == 0? "no more" : i.to_s, " bottle", i == 1? "": "s"].join
    end
  end
end
