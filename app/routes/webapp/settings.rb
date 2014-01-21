require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'slim'

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
 	property :device_router,	String # device router 
 end

 class Conf
 	include DataMapper::Resource

 	property :id,				Serial	# auto increment integer key
 	property :attribute, Text 	# gotta revisit this schema
 	property :value,		Text 	# revisit the schema
 end

 DataMapper.finalize
 #DataMapper.auto_upgrade!
 DataMapper.auto_migrate!

## create some sample resources 
 # create a sample router 
 @router = Router.create(
 	:router_address		=> "192.168.1.204",
 	:router_desc      => "ISY994i",
 	:router_auth_user	=> "admin",
 	:router_auth_pass	=> "admin"
 	)

 # create a sample device
 @device = Device.create(
 	:device_address		=> "21%2016%2039%201",
 	:device_desc		  => "Master Bedroom Lamp",
 	:device_type		  => "insteon-dim",
 	:device_router		=> "ISY994i"
 	)

# create a sample configuration
@conf = Conf.create(
	:attribute     => "wunderground_zip",
	:value         => "10044",
	)


get '/settings' do
  @routers = Router.all
  @devices = Device.all
  @confs = Conf.all
  erb :settings
end

get '/settings/attributes' do
  @confs = Conf.all
  erb :settings_attributes
end

get '/settings/devices' do
  @devices = Device.all
  erb :settings_devices
end

get '/settings/routers' do
  @routers = Router.all
  erb :settings_routers
end
#get '/settings' do
#  @routers = Router.all
#  @devices = Device.all
#  @confs = Conf.all
#  erb :settings
#end