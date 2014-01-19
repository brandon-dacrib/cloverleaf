#sample sinatra
require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'slim'

get ('/') { erb :index}
get ('/blinds') { erb :blinds}
get ('/lights') { erb :lights}
get ('/sensors') {erb :sensors}
get ('/settings') { erb :settings}
#get ('/test') { slim :test}

# If you want the logs displayed you have to do this before the call to setup
  DataMapper::Logger.new($stdout, :debug)

  # An in-memory Sqlite3 connection:
  #DataMapper.setup(:default, 'sqlite::memory:')

  # A Sqlite3 connection to a persistent database
  DataMapper.setup(:default, 'sqlite:///Users/brandon/Documents/devel/cloverleaf/app/tests/test.db')
 
 class Router
 	include DataMapper::Resource

 	property :router_id,		Serial 	# auto increment integer key
 	property :router_address,	Text 	# dunno what this should be but I will use text for not
 	property :router_desc,		Text 	# router desc
 	property :router_auth_user, Text 	# username
 	property :router_auth_pass, Text 	# pass
 end

 class Device
 	include DataMapper::Resource

 	property :device_id,		Serial	# auto increment integer key
 	property :device_address,	String 	# text block for the address
 	property :device_desc,		Text	# text block for descriptions
 	property :device_type,		String	# varchar type string for short strings
 	property :device_router,	Integer # device router 
 end

 DataMapper.finalize
 #DataMapper.auto_migrate!

 # create a sample resource 
 @router = Router.create(
 	:router_address		=> "192.168.1.204",
 	:router_desc		=> "ISY994i",
 	:router_auth_user	=> "admin",
 	:router_auth_pass	=> "admin"
 	)

get '/test' do
  @routers = Router.all
  slim :test
end