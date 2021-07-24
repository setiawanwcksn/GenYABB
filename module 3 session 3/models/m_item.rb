require_relative '../db/mysql_connector.rb'

class MItem
    attr_accessor :id, :name, :price, :category
    def initialize(param)
        @id = param["id_item"]
        @name = param["name"]
        @price = param["price"]
        @category = []
    end

    def self.get_all_items
        client = create_db_client
        rawData = client.query("SELECT * FROM items")
        convert_sql_to_array(rawData)       
    end

    def self.insert_item_to_db(param)
        client = create_db_client
        client.query("INSERT INTO items (name,price) VALUES ('#{param['name']}','#{param['price']}')")
        last_item_id = client.last_id()
        client.query("INSERT INTO item_categories (fk_item,fk_category) VALUES ('#{last_item_id}','#{param['category']}')")

    end

    def self.convert_sql_to_array(rawData)
        items = Array.new
        rawData.each do |data|
            item = MItem.new(data)
            items.push(item)
        end 
        return items
    end
end