require 'sinatra'
require 'sinatra/reloader'
require_relative './db_connector'

get '/' do
  items = get_all_items
  categories = get_all_categories
  erb :index, locals:{
    items: items,
    categories: categories
  }
end

get '/items/new' do
  items = get_all_categories
  erb :create, locals:{
    items: items
  }
end

post '/items/create' do
  name = params['name']
  price = params['price']
  categories = params['categories']
  create_new_item(name, price, categories)
  redirect '/'
end

get '/items/delete/:id' do
  id = params['id']
  delete_an_item(id)
  redirect '/'
end

get '/items/show/:id' do
  id = params['id']
  items = show_details(id)
  erb :show, locals:{
    items: items
  }
end

get '/items/edit/:id' do
  id = params['id']
  items = show_details(id)
  categories = get_all_categories

  erb :edit, locals:{
    items: items,
    categories: categories
  }
end

post '/items/update/' do
  id = params['id']
  name = params['name']
  price = params['price']
  categories = params['categories']
  create_new_item(name, price, categories)
  redirect '/'
end