#insteon devices attached to an ISY99 have a resful API documented here: #http://wiki.universal-devices.com/index.php?title=ISY-99i_Series_INSTEON:REST_Interface
#for those we really just need to translate the URL, samples below
require 'uri'

class ISY
  include HTTParty
  base_uri '192.168.1.204'
  basic_auth 'admin', 'admin'
end

get '/api/do/:nodeid/0/*' do
  node = URI.encode("#{params[:nodeid]}")
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
  response = ISY.get("/rest/nodes/#{node}/cmd/DIM/50")
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
