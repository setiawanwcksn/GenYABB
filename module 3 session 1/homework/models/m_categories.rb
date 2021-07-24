class MCategories
    attr_accessor :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end
    def get_all_categories
        client = create_db_client
        rawData = client.query("Select * from categories")
    end
end