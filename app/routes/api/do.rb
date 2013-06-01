#insteon devices attached to an ISY99 have a resful API documented here: #http://wiki.universal-devices.com/index.php?title=ISY-99i_Series_INSTEON:REST_Interface
#for those we really just need to translate the URL, samples below

get '/do/*/1' do
  response = HTTParty.get('http://dacrib.net/cloverleaf/test/lighton')
  puts response.body, response.code, response.message, response.headers.inspect
  @output = response.code, response.body
  "#{@output}"
end

get '/do/:nodeid/0' do
  response = HTTParty.get('http://192.168.1.204/rest/nodes/#{params[:nodeid]}/cmd/DOF')
  puts response.body, response.code, response.message, response.headers.inspect
  @output = response.code, response.body
  "#{@output}"
end