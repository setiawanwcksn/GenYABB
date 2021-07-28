class WhoLikeIt
    attr_accessor :names
    def initialize
        @names = []        
    end
    def likes
       "#{@names.join(' and ')} likes this"
    end
end
# wli = WhoLikeIt.newz
# wli.names = ["lala","lili"]
# wli.likes