#insteon devices attached to an ISY99 have a resful API documented here: #http://wiki.universal-devices.com/index.php?title=ISY-99i_Series_INSTEON:REST_Interface
#for those we really just need to translate the URL, samples below
require 'uri'
require 'sequel'
require 'logger'
require 'socket'

class ISY
  include HTTParty
  @keys = Keys
    @isy_uri  = Keys.select(:value).where[:key => 'isy_uri'].value
    @isy_user = Keys.select(:value).where[:key => 'isy_user'].value
    @isy_pass = Keys.select(:value).where[:key => 'isy_pass'].value
    #print " uri: #{@isy_uri} user: #{@isy_user} pass: #{@isy_pass}"

  # Create bits for httparty
    base_uri "#{@isy_uri}"
    basic_auth "#{@isy_user}", "#{@isy_pass}"
end

class LimitlessLED
@keys = Keys
  @lled_ip = Keys.select(:value).where[:key => 'lled_ip'].value
  @lled_port = Keys.select(:value).where[:key => 'lled_port'].value
  #print " lled_ip: #{@lled_ip} lled_port #{@lled_port}"
end

class Device
  @devices = Devices
end

class Router
  @routers = Routers
end

get '/api/do/:device_id/0/*' do
  @device_id = "#{params[:device_id]}"
  @device_routerid = Devices.select(:device_routerid).where[:device_id => params[:device_id]].device_routerid
  @device_routertype = Routers.select(:router_type).where[:router_id => "#{@device_routerid}"].router_type
  @device_address = URI.encode(Devices.select(:device_address).where[:device_id => params[:device_id]].device_address)
  
case @device_routertype
  when "isy" 
    response = ISY.get("/rest/nodes/#{@device_address}/cmd/DFOF")
    puts "device_id: #{@device_id} device_address: #{@device_address} device_routerid: #{@device_routerid} device_router_type: #{@device_routertype} router_address: #{@router_address}"
    puts response.code, response.body, response.message, response.headers.inspect
    @output = response.message
    "#{@output}"
  when "limitlessled"
    system("modules/limitlessled-rgb.rb off") 
    puts "device_id: #{@device_id} device_address: #{@device_address} device_routerid: #{@device_routerid} device_router_type: #{@device_routertype} router_address: #{@router_address}"
  when "lirc"
    system("modules/lirc.rb #{@remote} #{@action}")
  else "puts device_routertype unknown"
end
end

get '/api/do/:device_id/1/*' do
  @device_id = URI.encode("#{params[:device_id]}")
  @device_address = URI.encode(Devices.select(:device_address).where[:device_id => params[:device_id]].device_address)
  @device_routerid = Devices.select(:device_routerid).where[:device_id => params[:device_id]].device_routerid
  @router_address = Routers.select(:router_address).where[:router_id => "#{@device_routerid}"].router_address
  response = ISY.get("/rest/nodes/#{@device_address}/cmd/DFON")
  puts "device_id: #{@device_id} device_address: #{@device_address} device_routerid: #{@device_routerid} router_address: #{@router_address}"
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
