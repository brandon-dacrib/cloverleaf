#insteon devices attached to an ISY99 have a resful API documented here: #http://wiki.universal-devices.com/index.php?title=ISY-99i_Series_INSTEON:REST_Interface
#for those we really just need to translate the URL, samples below
require 'uri'
require 'sequel'
require 'logger'
#require '/Users/brandon/Documents/devel/cloverleaf/app/routes/api/database.rb'


class ISY
  include HTTParty
  @keys = Keys
    @isy_uri  = Keys.select(:value).where[:key => 'isy_uri'].value
    @isy_user = Keys.select(:value).where[:key => 'isy_user'].value
    @isy_pass = Keys.select(:value).where[:key => 'isy_pass'].value
    print " uri: #{@isy_uri} user: #{@isy_user} pass: #{@isy_pass}"

  # Create bits for httparty
    base_uri "#{@isy_uri}"
    basic_auth "#{@isy_user}", "#{@isy_pass}"
end

class Device
  @devices = Devices
end

class Router
  @routers = Routers
end

get '/api/do/:nodeid/0/*' do
  node = URI.encode("#{params[:nodeid]}")
  address = Devices.select(:device_address).where[:device_id => params[:nodeid]]
  routerid = Devices.select(:device_routerid).where[:device_id => params[:nodeid]]
  router_address = Routers.select(:router_address).where[:router_id => "#{routerid}"]
  response = ISY.get("/rest/nodes/#{node}/cmd/DFOF")
  puts response.code, response.body, response.message, response.headers.inspect
  @output = response.message
  "#{@output}"
end

get '/api/do/:nodeid/1/*' do
  node = URI.encode("#{params[:nodeid]}")
  response = ISY.get("/rest/nodes/#{node}/cmd/DFON")
  puts response.code, response.body, response.message, response.headers.inspect
  @output = response.message
  "#{@output}"
end

get '/api/do/:nodeid/2/*' do
  node = URI.encode("#{params[:nodeid]}")
  response = ISY.get("/rest/nodes/#{node}/cmd/DFON/128")
  puts response.code, response.body, response.message, response.headers.inspect
  @output = response.message
  "#{@output}"
end

get '/api/do/limitlessledrgb/:state' do
  system("modules/limitlessled-rgb.rb #{params[:state]}")
  @output = 'OK'
  "#{@output}"
end

get '/api/do/limitlessledrgb/color/:color' do
  system("modules/limitlessled-rgb.rb color #{params[:color]}")
  @output = 'OK'
  "#{@output}"
end
