require_relative '../db/mysql_connector.rb'

class MCategory
    attr_reader :id, :name

    def initialize(param)
        @id = param['id_category']
        @name = param['name']
    end

    def self.get_all_categories
        client = create_db_client
        rawData = client.query("select * from categories")
        categories = Array.new
    
        rawData.each do |data|
            category = MCategory.new(data)
            categories.push(category)
        end 
        categories
    end
end