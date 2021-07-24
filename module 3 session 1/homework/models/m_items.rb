require_relative '../db/db_connector'
class MItems
    attr_accessor :id,:name,:price,:category

    def initialize(id,name,price,category=nil)
        @id = id
        @name = name
        @price = price
        @category = category

        # puts id ,name,price, category
    end
    def get_all_items
        client = create_db_client
        rawData = client.query("SELECT * FROM items")
    end
    def get_all_item_with_categories
        client = create_db_client
        rawData = client.query(
            "SELECT items.*, categories.id_category ,categories.name as category_name
            FROM menus JOIN categories
            WHERE categories.id_category = menus.fk_category"
        )    
    end
    def get_id_item(name)
        client = create_db_client
        rawData = client.query("SELECT * FROM items WHERE name = '#{name}'")  
        items = rawData.each[0]    
    end
    def create_new_item(name,price, categories)
        client = create_db_client
        client.query("INSERT INTO items (name,price) values ('#{name}','#{price}')")
        idItem = get_id_item(name)
        puts idItem["id_item"]
        client.query("INSERT INTO item_categories (fk_item, fk_category) VALUES ('#{idItem["id_item"]}','#{categories}') ")
    end
    def delete_an_item(id)
        client = create_db_client
        client.query("DELETE FROM item_categories WHERE fk_item = '#{id}'")
        client.query("DELETE FROM items WHERE id_item = '#{id}'")
    end
    def show_details(id)
        client = create_db_client
        rawData = client.query("SELECT items.*, categories.name as category_name, categories.id_category FROM items 
                        JOIN item_categories ON item_categories.fk_item = items.id_item
                        JOIN categories ON categories.id_category = item_categories.fk_category
                        WHERE id_item = '#{id}'")
    end
    def update_an_item(id, name, price, categories)    
        client = create_db_client
        rawData = client.query("UPDATE items SET name = '#{name}',price = '#{price}' WHERE id_item = '#{id}'")
        rawData2 = client.query("UPDATE item_categories SET fk_category = '#{categories}' WHERE fk_item = '#{id}'")
    end
end