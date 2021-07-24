require 'erb'
require './models/order.rb'
class OrderController
    def create_order(params)
        order = Order.new({
            reference_no: params['ref_no'],
            customer_name: params['cust_name'],
            date: params['date']

        })
        order.save
        renderer = ERB.new(File.read("./views/order.erb"))
        renderer.result(binding)        
    end
    def get_all_items
        order = Order.new
        order.get_all_orders
        renderer = ERB.new(File.read("./views/order.erb"))
        renderer.result(binding)  
    end
end