require_relative '../models/m_item'
require_relative '../models/m_category'

class CItem
    def list_all_items
        items = MItem.get_all_items
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end
    def create_item(param)
        items = MItem.insert_item_to_db(param)

        list_all_items
    end
    def create_item_form
        categories = MCategory.get_all_categories
        renderer = ERB.new(File.read("./views/create.erb"))
        renderer.result(binding)
    end
end