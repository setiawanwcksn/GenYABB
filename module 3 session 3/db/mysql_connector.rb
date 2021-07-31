require 'mysql2'
def create_db_client
    client = Mysql2::Client.new(
        :host => ENV['db_host'],
        :username => ENV['db_user'],
        :password => ENV['db_pass'],
        :database => ENV['db_name']
    )
    client
end