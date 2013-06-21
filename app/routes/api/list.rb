#sample sinatra
require 'rubygems'
require 'sinatra'
#require 'sqlite3'
require 'data_mapper'
#require 'dm-sqlite-adapter'

DataMapper.setup(:default, 'sqlite://db/my_way_development')
#DataMapper.setup(:default, 'sqlite://db/sample.db')

class Device < DataMapper::Base
  property :id, :text
  property :address, :text
  property :type, :string
  property :name, :text
  property :control, :string
  property :protocol, :string
end

get '/list' do
  @devices = Device  :limit => 10,
  :order  => 'id'
end