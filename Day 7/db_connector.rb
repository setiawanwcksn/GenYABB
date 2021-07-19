require 'mysql2'
require './item.rb'
require './category.rb'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "",
        :database => "food_oms_db"
    )
    client
end

def get_all_categories
    client = create_db_client
    items = client.query("Select * from categories")

end

def get_all_items
    client = create_db_client
    rawData = client.query("SELECT * FROM items")
    items = Array.new

    rawData.each do | data |        
        item = Item.new(data["id_item"],data["name"],data["price"])
        items.push(item)
    end
    items
end

def get_all_item_with_categories
    client = create_db_client
    rawData = client.query(
        "SELECT items.*, categories.id_category ,categories.name as category_name
        FROM menus JOIN categories
        WHERE categories.id_category = menus.fk_category"
    )    
    items = Array.new

    rawData.each do | data |
        category = Category.new(data["id_category"],data["category_name"])
        item = Menu.new(data["id"],data["name"],["price"], category)
        items.push(item)
    end    
    items
end

def get_item_cheper(price)
    client = create_db_client
    items = client.query(
        "SELECT *
        FROM menus 
        WHERE price < #{price}"
    )
end

def create_new_item(name,price)
    client = create_db_client
    client.query("INSERT INTO menus (name,price) values ('#{name}','#{price}')")
end