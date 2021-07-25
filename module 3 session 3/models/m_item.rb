require_relative '../db/mysql_connector.rb'
require_relative './m_category.rb'

class MItem
    attr_reader :id, :name, :price, :category
    def initialize(param, category = nil)
        @id = param["id_item"]
        @name = param["name"]
        @price = param["price"]
        @category = category
        
    end

    def self.get_all_items
        client = create_db_client
        rawData = client.query("SELECT * FROM items")
        convert_sql_to_array(rawData)       
    end

    def self.insert_item_to_db(param, newcategory)
        client = create_db_client
        client.query("INSERT INTO items (name,price) VALUES ('#{param['name']}','#{param['price']}')")
        last_item_id = client.last_id()       
        categories = newcategory
        for category in categories do           
            client.query("insert into item_categories (fk_item, fk_category) values ('#{last_item_id}','#{category.id}')")
        end   
    end

    def self.show_item_by_id(param)
        client = create_db_client
        rawData = client.query("SELECT * FROM items WHERE id_item = #{param['id']}")
        data_item = rawData.each[0]
        
        rawData2 = client.query("SELECT * FROM item_categories WHERE fk_item = #{data_item['id_item']}")
        categories = Array.new

        rawData2.each do |data_categories|
            categoryy = MCategory.get_category_by_id(data_categories['fk_category'])
            category = MCategory.new(categoryy)
            categories.push(category)            
        end
        item = MItem.new(data_item, categories)             
        return item   
    end
    
    def self.convert_sql_to_array(rawData)
        items = Array.new
        rawData.each do |data|
            item = MItem.new(data)
            items.push(item)
        end 
        return items
    end
    
    def self.update(param,newcategory)
        client = create_db_client
        client.query("UPDATE items SET name = '#{param['name']}', price= #{param['price']} where id_item = #{param['id']}")
        client.query("DELETE from item_categories where fk_item = #{param['id']}")
        categories = newcategory
        for category in categories do           
            client.query("insert into item_categories (fk_item, fk_category) values ('#{param['id']}','#{category.id}')")
        end        
    end
    def self.action_delete_item(id)
        client = create_db_client
        client.query("DELETE FROM items WHERE id_item = #{id}")
    end
end