require_relative '../db/mysql_connector.rb'

class MCategory
    attr_accessor :id, :name

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
        return categories
    end
    def self.get_category_by_id(param)
        client = create_db_client
        rawData = client.query("select * from categories where id_category = '#{param}'")
        data = rawData.each[0]
        # category = MCategory.new(data)
        return data
    end
    def self.get_category(id)
        client = create_db_client
        rawData = client.query("select * from categories where id_category = '#{id}'")
        data = rawData.each[0]
        category = MCategory.new(data)
        return category
    end
    def self.delete_category_item(id)
        client = create_db_client
        client.query("DELETE FROM item_categories WHERE fk_item = #{id}")
    end
    def self.insert_new_category(name)
        client = create_db_client
        client.query("INSERT INTO categories (name) VALUES ('#{name}')")
    end
    def self.delete_category(id)
        self.delete_category_in_item_categories(id)
        client = create_db_client
        client.query("DELETE FROM  categories WHERE id_category = #{id}")
    end
    def self.delete_category_in_item_categories(id)
        client = create_db_client
        client.query("DELETE FROM item_categories WHERE fk_category = #{id}")
    end
    def self.update_category(param)
        client = create_db_client
        client.query("UPDATE categories SET name = '#{param['name']}' where id_category = #{param['id']}")
    end
end