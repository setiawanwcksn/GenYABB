require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "",
        :database => "food_oms_db"
    )
    client
end

# def get_all_categories
#     client = create_db_client
#     rawData = client.query("Select * from categories")
#     items = Array.new

#     rawData.each do | data |        
#         item = Category.new(data["id_category"],data["name"])
#         items.push(item)
#     end
#     return items
# end

# def get_all_items
#     client = create_db_client
#     rawData = client.query("SELECT * FROM items")
#     items = Array.new

#     rawData.each do | data |        
#         item = Item.new(data["id_item"],data["name"],data["price"])
#         items.push(item)
#     end
#     return items
# end

# def get_all_item_with_categories
#     client = create_db_client
#     rawData = client.query(
#         "SELECT items.*, categories.id_category ,categories.name as category_name
#         FROM menus JOIN categories
#         WHERE categories.id_category = menus.fk_category"
#     )    
#     items = Array.new

#     rawData.each do | data |
#         category = Category.new(data["id_category"],data["category_name"])
#         item = Item.new(data["id"],data["name"],["price"], category)
#         items.push(item)
#     end    
#     return items
# end

# def get_id_item(name)
#     client = create_db_client
#     rawData = client.query("SELECT * FROM items WHERE name = '#{name}'")  
#     items = rawData.each[0]    
#     return items
# end

# def create_new_item(name,price, categories)
#     client = create_db_client
#     client.query("INSERT INTO items (name,price) values ('#{name}','#{price}')")
#     idItem = get_id_item(name)
#     puts idItem["id_item"]
#     client.query("INSERT INTO item_categories (fk_item, fk_category) VALUES ('#{idItem["id_item"]}','#{categories}') ")
# end

# def delete_an_item(id)
#     client = create_db_client
#     client.query("DELETE FROM item_categories WHERE fk_item = '#{id}'")
#     client.query("DELETE FROM items WHERE id_item = '#{id}'")
# end

# def show_details(id)
#     client = create_db_client
#     rawData = client.query("SELECT items.*, categories.name as category_name, categories.id_category FROM items 
#                     JOIN item_categories ON item_categories.fk_item = items.id_item
#                     JOIN categories ON categories.id_category = item_categories.fk_category
#                     WHERE id_item = '#{id}'")
#     items = Array.new
#     data = rawData.each[0]
#         category = Category.new(data["id_category"],data["category_name"])
#         item = Item.new(data["id_item"],data["name"],data["price"], category)            
    
#     return item
# end

# def update_an_item(id, name, price, categories)    
#     client = create_db_client
#     rawData = client.query("UPDATE items SET name = '#{name}',price = '#{price}' WHERE id_item = '#{id}'")
#     rawData2 = client.query("UPDATE item_categories SET fk_category = '#{categories}' WHERE fk_item = '#{id}'")
# end