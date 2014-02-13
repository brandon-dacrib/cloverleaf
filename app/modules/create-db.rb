require 'sequel'
require 'logger'

DB = Sequel.sqlite('data/sqlite/cloverleaf.db', :loggers => [Logger.new($stdout)]) 
#DB = Sequel.sqlite('', :loggers => [Logger.new($stdout)])
DB.create_table :routers do
	primary_key :router_id
	String	:router_address, :unique => true, :null => false
	Text	:router_desc, :unique => true
	Text	:router_auth_user
	Text	:router_auth_pass
   Integer	:router_port, :null => false
   Text	:router_protocol, :null => false
   Text	:router_type, :null => false
end

DB.create_table :devices do
	primary_key	:device_id
	String	:device_address, :unique => true, :null => false
	Text	:device_desc
	String	:device_type
	String	:device_routerid
end

DB.create_table	:keys do
	primary_key	:key_id
	Text	:key, :null => false
	Text	:value, :null => false
end
