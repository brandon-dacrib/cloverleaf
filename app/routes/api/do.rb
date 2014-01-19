#insteon devices attached to an ISY99 have a resful API documented here: #http://wiki.universal-devices.com/index.php?title=ISY-99i_Series_INSTEON:REST_Interface
#for those we really just need to translate the URL, samples below
require 'uri'
require 'parseconfig'

class ISY
  include HTTParty
  conf = ParseConfig.new('config/cloverleaf.conf')
    @isy_uri = conf['isy_uri']
    @isy_user = conf['isy_user']
    @isy_pass = conf['isy_pass']

  # Create bits for httparty
    base_uri "#{@isy_uri}"
    basic_auth "#{@isy_user}", "#{@isy_pass}"
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
