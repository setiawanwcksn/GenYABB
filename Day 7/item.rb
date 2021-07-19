class Item
    attr_accessor :id,:name,:price,:category

    def initialize(id,name,price,category=nil)
        @id = id
        @name = name
        @price = price
        @category = category

        # puts id ,name,price, category
    end
end