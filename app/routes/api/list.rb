#sample sinatra
require 'rubygems'
require 'sinatra'
#require 'sqlite3'
require 'data_mapper'
require 'haml'
#require 'dm-sqlite-adapter'

#DataMapper.setup(:default, 'sqlite://db/my_way_development')
DataMapper.setup(:default, 'sqlite:///Users/brandon/Documents/devel/cloverleaf/app/db/sample.db')

class Device
  include DataMapper::Resource
  
  property :id,       Serial
  property :address,  String
  property :type,     String
  property :name,     Text
  property :control,  String
  property :protocol, String
end
DataMapper.finalize

get '/list' do
  @devices = Device.all
  puts @devices
end