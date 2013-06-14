require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new("/Users/brandon/Documents/devel/cloverleaf/app/db/sample.db")
db.execute("select * from devices") do |row|
  print row 
  print "\n"
end