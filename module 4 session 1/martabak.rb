class Martabak
    attr_reader :toping
    def initialize(toping)
        @toping = toping
    end
    def taste
        "Martabak #@toping is delicious"
    end
end