require 'sinatra'
require 'sinatra/reloader'
require './db_connector'


get '/' do
    items = get_all_items
    erb :index, locals:{
        items: items
    }
end

get '/items/new' do
    erb :create
end

get '/items/create' do
    name = params['name']
    price = params['price']
    create_new_item(name,price)
    redirect '/'
end