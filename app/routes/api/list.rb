#sample sinatra
require 'rubygems'
require 'sinatra'
require 'sqlite3'

get '/list' do
  db = SQLite3::Database.new("/Users/brandon/Documents/devel/cloverleaf/app/db/sample.db")
  db.execute("select * from devices") do |row|
    print row 
    print "\n"
    end
    "#{@output}"
end
