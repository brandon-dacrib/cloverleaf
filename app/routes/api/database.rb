require 'sequel'
require 'logger'
require 'sinatra/sequel'

DB = Sequel.sqlite('data/sqlite/cloverleaf.db', :loggers => [Logger.new($stdout)]) 
#DB = Sequel.sqlite('', :loggers => [Logger.new($stdout)])


class Devices < Sequel::Model
end

class Keys < Sequel::Model
end

class Routers < Sequel::Model
#Routers.set_dataset :routers
end

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
#puts "Router records: #{routers.all}"


