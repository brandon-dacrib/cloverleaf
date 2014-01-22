require 'sequel'
require 'logger'
require 'sinatra/sequel'

DB = Sequel.sqlite('/Users/brandon/Documents/devel/cloverleaf/app/tests/sequeltest.db', :loggers => [Logger.new($stdout)]) 
#DB = Sequel.sqlite('', :loggers => [Logger.new($stdout)])

#DB.create_table :routers do
#	primary_key :router_id
#	String	:router_address, :unique => true, :null => false
#	Text	:router_desc, :unique => true
#	Text	:router_auth_user
#	Text	:router_auth_pass
#end
#
#DB.create_table :devices do
#	primary_key	:device_id
#	String	:device_address, :unique => true, :null => false
#	Text	:device_desc
#	String	:device_type
#	String	:device_routerid
#end
#
#DB.create_table	:keys do
#	primary_key	:key_id
#	Text	:key, :null => false
#	Text	:value, :null => false
#end
#
#class Routers < Sequel::Model
#end

routers = DB[:routers] #create a dataset + insert some data into it
#routers.insert(:router_address => '192.168.1.204', :router_desc => 'ISY994i', :router_auth_user => 'admin', :router_auth_pass => 'admin')
#
devices = DB[:devices]
#devices.insert(:device_address => '21%2016%2039%201', :device_desc => 'Master Bedroom Lamp', :device_type => 'insteon-dim', :device_routerid => '1')
#
keys = DB[:keys]
#keys.insert(:key => 'wunderground_zip', :value => '10044')
#
# Print out the number of records
puts "Router records: #{routers.all}"

get '/settings/routers' do
	@routers = routers
	erb	:settings_routers
end

