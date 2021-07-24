require 'sinatra'
require './controllers/order_controller'
require_relative './controllers/c_item'

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