require 'sinatra'

get '/messages' do
    "<h1> hello world </h1>"
end

get '/login' do
    
    erb :login , locals: {
        no: 1,
        username: 'lala',
        password: 'passw'
    }
end

post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        return 'logged in!'
    else
        redirect '/login'
    end
end

get '/messages/:name' do
    name = params['name']
    color = params['color'].nil? ? params['color'] : 'DodgerBlue'
    erb :message, locals: {
        color: 'DodgerBlue',
        name: "Hai"
    }
end