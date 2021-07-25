require_relative '../models/m_item'
require_relative '../models/m_category'

class CCategory
    def list_all_categories        
        categories = MCategory.get_all_categories
        renderer = ERB.new(File.read("./views/category/list_categories.erb"))
        renderer.result(binding)
    end
    def create_category_form
        # categories = MCategory.get_all_categories
        renderer = ERB.new(File.read("./views/category/create.erb"))
        renderer.result(binding)
    end
    def create_category(name)
        categories = MCategory.insert_new_category(name)
    end
    def delete_category(id)        
        categories = MCategory.delete_category(id)        
    end
    def edit_category_form(id)
        categories = MCategory.get_category_by_id(id)
        category = MCategory.new(categories)
        renderer = ERB.new(File.read("./views/category/edit.erb"))
        renderer.result(binding)
    end
    def edit_category(param)
        categories = MCategory.update_category(param)        
    end
end