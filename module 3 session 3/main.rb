require 'sinatra'
require './controllers/order_controller'
require_relative './controllers/c_item'
require_relative './controllers/c_category'

get '/' do
    controller = CItem.new
    controller.list_all_items
end

get '/item/create' do
    controller = CItem.new
    controller.create_item_form
end

post '/item/create' do
    controller = CItem.new
    controller.create_item(params)
    redirect '/'
end

get '/item/show' do
    controller = CItem.new
    controller.show_item(params)
end

get '/item/edit' do
    controller = CItem.new
    controller.edit_form(params)
end

post '/item/edit' do
    controller = CItem.new
    controller.edit_item(params)
    redirect '/'
end

get '/item/delete' do
    controller = CItem.new
    controller.delete_item(params['id'])
    redirect '/'
end

get '/item/list_categories' do
    controller = CCategory.new
    controller.list_all_categories
end

get '/category/create' do
    controller = CCategory.new
    controller.create_category_form
end

post '/category/create' do
    controller = CCategory.new
    controller.create_category(params['name'])
    redirect '/item/list_categories'
end

get '/category/delete' do
    controller = CCategory.new
    controller.delete_category(params['id'])
    redirect '/item/list_categories'
end
get '/category/edit' do
    controller = CCategory.new
    controller.edit_category_form(params['id'])
end
post '/category/edit' do
    controller = CCategory.new
    controller.edit_category(params)
    redirect '/item/list_categories'
end
get '/category/show' do
    controller = CCategory.new
    controller.show_item_belongs_to_category(params['id'])
  end
# post '/order' do
#     controller = OrderController.new
#     controller.create_order(params)
# end

# get '/order' do
#     controller = OrderController.new
#     controller.find_order(params)
# end

# get '/order/edit/:ref_no' do
#     controller = OrderController.new
#     controller.edit_order(params)
# end

# get '/order/delete/:ref_no' do
#     controller = OrderController.new
#     controller.delete_order(params)
# end