require_relative '../models/m_item'
require_relative '../models/m_category'

class CItem
    def list_all_items
        items = MItem.get_all_items
        renderer = ERB.new(File.read("app/views/index.erb"))
        renderer.result(binding)
    end
    def create_item(param)
        categoryid = param["category"]     
        categories = Array.new
        for id_category in categoryid do
            category = MCategory.get_category(id_category)
            categories.push(category)
        end   
        items = MItem.insert_item_to_db(param,categories)
    end
    def create_item_form
        categories = MCategory.get_all_categories
        renderer = ERB.new(File.read("app/views/create.erb"))
        renderer.result(binding)
    end
    def show_item(param)        
        item = MItem.show_item_by_id(param)   
        categoryarr = Array.new
        for value in item.category do
            categoryarr.push(value.name)
        end     
        renderer = ERB.new(File.read("app/views/show.erb"))
        renderer.result(binding)
    end
    def edit_form(param)
        item = MItem.show_item_by_id(param)
        categoryarr = Array.new
        for value in item.category do
            categoryarr.push(value.id)
        end  
        categories = MCategory.get_all_categories
        renderer = ERB.new(File.read("app/views/edit.erb"))
        renderer.result(binding)
    end
    def edit_item(param)
        categoryid = param["category"]     
        categories = Array.new
        for id_category in categoryid do
            category = MCategory.get_category(id_category)
            categories.push(category)
        end        
        item = MItem.show_item_by_id(param)
        item = MItem.update(param,categories)
    end
    def delete_item(id)
        category = MCategory.delete_category_item(id)
        item = MItem.action_delete_item(id)        
    end
end