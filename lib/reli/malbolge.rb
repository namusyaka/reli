module RELI
  class Malbolge
    def initialize(options = {})
    end

    def run(code_)
      code = code_.split(//u).map(&:ord)
      @a = 0
      @c = 0
      @d = 0

      # load step
      @buffer = []
      @memory = []
      for char in code
        case crypt1 op char
        when 42, 47, 60, 105, 106, 111, 112, 118
          @memory[@c] = char
        else
          # error
          next
        end
        @c += 1
      end

      while @c < 3**10
        @memory[@c] = crz @memory[@c - 2], @memory[@c - 1]
        @c += 1
      end

      # run
      @c = 0
      while (crypt1 op @memory[@c]) != 118
        case crypt1 op @memory[@c]
        when 106
          @d = @memory[@d]
        when 104
          @c = @memory[@d]
        when 42
          rotr
          @a = @memory[@d]
        when 112
          @a = @memory[@d] = crz @memory[@d], @a
        when 60
          @buffer[@buffer.length] = (@a.modulo 256).chr
        when 47
          @a = $stdin.getc.ord
        end
        @memory[@c] = crypt2 (@memory[@c] - 33).modulo 94
        @c = inc(@c)
        @d = inc(@d)
      end

      @buffer.join
    end

    def crypt1(m)
      "+b(29e*j1VMEKLyC})8&m#~W>qxdRp0wkrUo[D7,XTcA\"lI.v%{gJh4G\\-=O@5`_3i<?Z';FNQuY]szf$!BS/|t:Pn6^Ha".split(//)[m].ord
    end

    def crypt2(m)
      "5z]&gqtyfr$(we4{WP)H-Zn,[%\\3dL+Q;>U!pJS72FhOA1CB6v^=I_0/8|jsb9m<.TVac`uY*MK'X~xDl}REokN:#?G\"i@".split(//)[m].ord
    end

    def crz(a, b)
      [a, b].map { |item|
        sprintf("%010d", item.to_s(3).to_i).split(//).map { |char| char.ord - 0x30 }
      }.transpose.map { |items|
        ([1, 0, 0, 1, 0, 2, 2, 2, 1][items[0] * 3 + items[1]] + 0x30).chr
      }.join.to_i(3)
    end

    def rotr()
      @memory[@d] += (@memory[@d].modulo 3) * (3 ** 10)
      @memory[@d] /= 3
    end

    def op(c)
      (c - 33 + @c).modulo 94
    end

    def inc(n)
      n += 1
      n = 0 if n == 3**10
      return n
    end
  end
end
