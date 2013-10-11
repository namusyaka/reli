module RELI
  class Malbolge
    def initialize(options = {})
    end

    # lazy evaluation
    def get_orid(a)
      @oridinal_memory[a] = crz get_orid(a - 2), get_orid(a - 1) if a >= @oridinal_memory.length
      return @oridinal_memory[a]
    end

    def get(addr)
      a = addr[0]
      @memory[a] = get_orid a if a >= @memory.length
      return @memory[a]
    end

    def run(code_)
      code = code_.split(//u).map(&:ord)
      @a = 0
      @c = 0
      @d = 0

      # load step
      @buffer = []
      @oridinal_memory = @memory = []
      for char in code
        case crypt1 char
        when 42, 47, 60, 105, 106, 111, 112, 118
          @oridinal_memory[@c] = char
        else
          # error
          next
        end
        @c += 1
      end

      # run
      @c = 0
      while (crypt1 [@c]) != 118
        case crypt1 [@c]
        when 106
          @d = get [@d]
        when 104
          @c = get [@d]
        when 42
          rotr
          @a = get [@d]
        when 112
          @a = @memory[@d] = crz([@d], @a)
        when 60
          @buffer[@buffer.length] = @a
        when 47
          @a = $stdin.getc.ord
        end
        @memory[@c] = crypt2 [@c]
        @c = inc @c
        @d = inc @d
      end

      @buffer.map { |a| (a.modulo 256).chr}.join
    end

    def crypt1(m)
      m = get m if m.class == Array
      "+b(29e*j1VMEKLyC})8&m#~W>qxdRp0wkrUo[D7,XTcA\"lI.v%{gJh4G\\-=O@5`_3i<?Z';FNQuY]szf$!BS/|t:Pn6^Ha"
        .split(//)[(m - 33 + @c).modulo 94].ord
    end

    def crypt2(m)
      "5z]&gqtyfr$(we4{WP)H-Zn,[%\\3dL+Q;>U!pJS72FhOA1CB6v^=I_0/8|jsb9m<.TVac`uY*MK'X~xDl}REokN:#?G\"i@"
        .split(//)[((get m) - 33).modulo 94].ord
    end

    def crz(a, b)
      a = get a if a.class == Array
      [a, b].map { |item|
        sprintf("%010d", item.to_s(3).to_i).split(//).map { |char| char.ord - 0x30 }
      }.transpose.map { |items|
        ([1, 0, 0, 1, 0, 2, 2, 2, 1][items[0] * 3 + items[1]] + 0x30).chr
      }.join.to_i(3)
    end

    def rotr()
      @memory[@d] += ((get [@d]).modulo 3) * 3 ** 10
      @memory[@d] /= 3
    end

    def inc(n)
      n += 1
      n = 0 if n == 3**10
      return n
    end
  end
end
